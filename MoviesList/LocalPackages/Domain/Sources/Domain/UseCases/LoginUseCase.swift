//
//  File.swift
//  
//
//  Created by Daniil Markish on 29/03/2023.
//

import Foundation

public struct LoginUseCase {
    
    private let authRepository: AuthorizationRepository
    private let authDataRepository: AuthDataRepository
    
    public init(authRepository: AuthorizationRepository, authDataRepository: AuthDataRepository) {
        self.authRepository = authRepository
        self.authDataRepository = authDataRepository
    }
    
    public func run(email: String, password: String) async throws -> UserModel {
        let data = try await authRepository.login(email: email, password: password)
        authDataRepository.setToken(data.token)
        return data
    }
}
