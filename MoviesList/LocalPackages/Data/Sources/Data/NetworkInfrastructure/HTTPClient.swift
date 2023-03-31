//
//  File.swift
//  
//
//  Created by Daniil Markish on 31/03/2023.
//

import Foundation

public protocol HTTPClient {
    func executeRequest(_ request: URLRequest) async throws
    func executeRequset<Result>(_ request: URLRequest) async throws -> Result where Result: Decodable
}

public final class HTTPClientImpl: HTTPClient {
    
    public init() {}
    
    public func executeRequest(_ request: URLRequest) async throws {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            try self.processResponse(data: data, response: response)
        } catch {
            try processError(error: error)
            throw APIError.unknown
        }
    }
    
    public func executeRequset<Result: Decodable>(_ request: URLRequest) async throws -> Result {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            return try self.processResponse(data: data, response: response)
        } catch {
            try processError(error: error)
            throw APIError.unknown
        }
    }
    
    // MARK: - Helpers
    
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
                throw APIError.serverError(description: error.localizedDescription)
            }
        default:
            throw APIError.unknown
        }
    }
    
    private func processResponse<Result>(data: Data, response: URLResponse) throws -> Result where Result: Decodable {
        guard let response = response as? HTTPURLResponse else {
            throw APIError.noResponse
        }
        
        let statusCode = response.statusCode
        
        switch statusCode {
        case 200...299:
            return try jsonDecoder.decode(Result.self, from: data)
        case 401:
            throw APIError.unauthorized
        case 403:
            let errorModel = try jsonDecoder.decode(ServerErrorModel.self, from: data)
            throw APIError.serverError(description: errorModel.error)
        default:
            throw APIError.unknown
        }
    }
    
    private func processResponse(data: Data, response: URLResponse) throws {
        guard let response = response as? HTTPURLResponse else {
            throw APIError.noResponse
        }
        
        let statusCode = response.statusCode
        
        switch statusCode {
        case 200...299:
            return
        case 401:
            throw APIError.unauthorized
        case 403:
            let errorModel = try jsonDecoder.decode(ServerErrorModel.self, from: data)
            throw APIError.serverError(description: errorModel.error)
        default:
            throw APIError.unknown
        }
    }
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
}
