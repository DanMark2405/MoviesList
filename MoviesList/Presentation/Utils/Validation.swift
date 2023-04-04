//
//  ValidationString.swift
//  MoviesList
//
//  Created by Daniil Markish on 04/04/2023.
//

import Foundation
import Combine

enum ValidationType: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case nickname = "^\\w{3,}$"
    case password = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]).{8,}$"
    
    var errorMessage: String {
        switch self {
        case .email:
            return L10n.Validation.email
        case .nickname:
            return L10n.Validation.nickname
        case .password:
            return L10n.Validation.password
        }
    }
}



