//
//  APIClient.swift
//  MoviesList
//
//  Created by Daniil Markish on 28/03/2023.
//

import Foundation

protocol APIClient {
    func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint) async throws
    func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint) async throws -> Endpoint.ResultType where Endpoint.ResultType: Decodable
}

public struct APIClientImpl: APIClient {
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint) async throws {
        let request = try endpoint.request()
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            try processResponse(response: response)
        } catch {
            try processError(error: error)
        }
    }
    
    func request<Endpoint : APIEndpoint>(_ endpoint: Endpoint) async throws -> Endpoint.ResultType where Endpoint.ResultType : Decodable {
        let request = try endpoint.request()
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            try processResponse(response: response)
            
            let result = try self.jsonDecoder.decode(Endpoint.ResultType.self, from: data)
            return result
        } catch {
            try processError(error: error)
            throw APIError.unknown
        }
    }
    
    private func processResponse(response: URLResponse?) throws {
        guard let response = response as? HTTPURLResponse else {
            throw APIError.noResponse
        }
        
        let statusCode = response.statusCode
        
        switch statusCode {
        case 200...299:
            return
        case 401:
            throw APIError.unauthorized
        default:
            throw APIError.unknown
        }
    }
    
    private func processError(error: Error) throws {
        switch error {
        case is APIError:
            throw error
        case is DecodingError:
            throw APIError.decode
        case let error as URLError:
            if error.code == .notConnectedToInternet {
                throw APIError.notConnected
            } else {
                throw APIError.serverError(error: error)
            }
        default:
            throw APIError.unknown
        }
    }

}
