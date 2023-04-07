//
//  File.swift
//  
//
//  Created by Daniil Markish on 07/04/2023.
//

import Foundation

public struct RegisterUseCase {
    
    private let authRepository: AuthorizationRepository
    
    public init(authRepository: AuthorizationRepository) {
        self.authRepository = authRepository
    }
    
    public func run(model: AuthModel) async throws {
        let data = try await authRepository.register(model: model)
        return data
    }
}
