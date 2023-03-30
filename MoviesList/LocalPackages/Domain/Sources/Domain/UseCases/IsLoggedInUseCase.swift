//
//  File.swift
//  
//
//  Created by Daniil Markish on 30/03/2023.
//

import Foundation

public struct IsLoggedInUseCase {
    
    private let authDataRepository: AuthDataRepository
    
    public init(authDataRepository: AuthDataRepository) {
        self.authDataRepository = authDataRepository
    }
    
    public func run() -> Bool {
        authDataRepository.hasToken
    }
    
}
