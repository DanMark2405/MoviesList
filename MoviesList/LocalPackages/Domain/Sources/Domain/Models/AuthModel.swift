//
//  File.swift
//  
//
//  Created by Daniil Markish on 03/04/2023.
//

import Foundation

public struct AuthModel {
    public let nickname: String
    public let email: String
    public let password: String
    public let verificationCode: String?
    
    public init(nickname: String, email: String, password: String, verificationCode: String? = nil) {
        self.nickname = nickname
        self.email = email
        self.password = password
        self.verificationCode = verificationCode
    }
}
