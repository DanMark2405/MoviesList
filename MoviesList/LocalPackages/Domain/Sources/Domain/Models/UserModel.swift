//
//  File.swift
//  
//
//  Created by Daniil Markish on 29/03/2023.
//

import Foundation

public struct UserModel {
    let nickname: String
    let firstname: String
    let surname: String
    let email: String
    
    public init(nickname: String, firstname: String, surname: String, email: String) {
        self.nickname = nickname
        self.firstname = firstname
        self.surname = surname
        self.email = email
    }
}
