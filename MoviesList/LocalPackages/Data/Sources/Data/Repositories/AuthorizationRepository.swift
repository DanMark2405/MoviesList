//
//  File.swift
//  
//
//  Created by Daniil Markish on 29/03/2023.
//

import Foundation
import Domain

public final class AuthorizationRepositoryImpl: AuthorizationRepository {
  
    private let apiManager: APIManager
    
    public init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    public func login(email: String, password: String) async throws -> UserModel {
        try await apiManager.request(APIEndpoints.Login(email: email, password: password)).toModel
    }
}
