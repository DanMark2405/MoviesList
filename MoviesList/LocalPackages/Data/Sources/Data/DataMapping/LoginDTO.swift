//
//  File.swift
//  
//
//  Created by Daniil Markish on 07/04/2023.
//

import Foundation
import Domain

struct LoginDTO: Decodable {
    let token: String
    let nickname: String
    let firstname: String
    let surname: String
    let email: String
}

extension LoginDTO {
    var toDomain: UserModel {
        .init(token: token,
              nickname: nickname,
              firstname: firstname,
              surname: surname,
              email: email)
    }
}
