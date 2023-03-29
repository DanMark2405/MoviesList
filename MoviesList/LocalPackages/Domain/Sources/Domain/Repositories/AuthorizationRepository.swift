//
//  File.swift
//  
//
//  Created by Daniil Markish on 29/03/2023.
//

import Foundation

public protocol AuthorizationRepository {
    func login(email: String, password: String) async throws -> UserModel
}
