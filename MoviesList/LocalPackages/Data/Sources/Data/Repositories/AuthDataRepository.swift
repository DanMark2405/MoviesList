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
    
    public init() {}
    
    public var token: String? {
        keychain[Constants.token]
    }
    
    public var hasToken: Bool {
        if let token = token, !token.isEmpty {
            return true
        } else {
            return false
        }
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

