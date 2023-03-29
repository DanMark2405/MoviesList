//
//  File.swift
//  
//
//  Created by Daniil Markish on 29/03/2023.
//

import Foundation
import Domain

public class UserAPIClientImpl: APIClientImpl {
    
    public init(authDataRepository: AuthDataRepository) {
        self.authDataRepository = authDataRepository
        super.init()
    }
    
    private let authDataRepository: AuthDataRepository
    
    public override func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint) async throws {
        guard let token = authDataRepository.token else {
            throw APIError.unauthorized
        }
        
        var request = try endpoint.request()
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            try processResponse(response: response)
        } catch {
            try processError(error: error)
        }
    }
    
    public override func request<Endpoint : APIEndpoint>(_ endpoint: Endpoint) async throws -> Endpoint.ResultType where Endpoint.ResultType : Decodable {
        guard let token = authDataRepository.token else {
            throw APIError.unauthorized
        }
        
        var request = try endpoint.request()
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
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
}

