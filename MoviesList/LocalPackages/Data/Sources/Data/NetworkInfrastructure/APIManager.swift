//
//  APIClient.swift
//  MoviesList
//
//  Created by Daniil Markish on 28/03/2023.
//

import Foundation
import Domain

public protocol APIManager {
    func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint) async throws
    func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint) async throws -> Endpoint.ResultType where Endpoint.ResultType: Decodable
}

public final class GuestAPIManager: APIManager {
    
    private let httpClient: HTTPClient
    
    public init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    public func request<Endpoint>(_ endpoint: Endpoint) async throws where Endpoint : APIEndpoint {
        let request = try endpoint.request()
        try await httpClient.executeRequest(request)
    }
    
    public func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint) async throws -> Endpoint.ResultType
    where Endpoint.ResultType: Decodable {
        let request = try endpoint.request()
        return try await httpClient.executeRequset(request)
    }
}

public final class UserAPIManager: APIManager {
    
    private let httpClient: HTTPClient
    private let authDataRepository: AuthDataRepository
    
    public init(httpClient: HTTPClient, authDataRepository: AuthDataRepository) {
        self.httpClient = httpClient
        self.authDataRepository = authDataRepository
    }
    
    public func request<Endpoint>(_ endpoint: Endpoint) async throws where Endpoint : APIEndpoint {
        
        guard let token = authDataRepository.token else {
            throw APIError.unauthorized
        }
        
        var request = try endpoint.request()
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        try await httpClient.executeRequest(request)
    }
    
    public func request<Endpoint: APIEndpoint>(_ endpoint: Endpoint) async throws -> Endpoint.ResultType
    where Endpoint.ResultType: Decodable {
        guard let token = authDataRepository.token else {
            throw APIError.unauthorized
        }
        
        var request = try endpoint.request()
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return try await httpClient.executeRequset(request)
    }
}

