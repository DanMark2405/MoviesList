//
//  File.swift
//  
//
//  Created by Daniil Markish on 29/03/2023.
//

import Foundation
import KeychainAccess
import Domain

public final class AuthDataRepositoryImpl: AuthDataRepository {
    
    private enum Constants {
        static let service = "com.Markish.MoviesList"
        static let token = "token"
    }
    
    public var token: String? {
        keychain[Constants.token]
    }
    
    public func setToken(_ token: String) {
        keychain[Constants.token] = token
    }
    
    public func deleteToken() {
        keychain[Constants.token] = nil
    }
    
    // MARK: Private
    
    private let keychain = Keychain(service: Constants.service)
    
}
