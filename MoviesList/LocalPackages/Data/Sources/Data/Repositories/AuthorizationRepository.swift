//
//  File.swift
//  
//
//  Created by Daniil Markish on 29/03/2023.
//

import Foundation
import Domain

public final class AuthorizationRepositoryImpl: AuthorizationRepository {
  
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func login(email: String, password: String) async throws -> UserModel {
        try await apiClient.request(APIEndpoints.Login(email: email, password: password)).toModel
    }
}
