//
//  AnyPublisher+Extensions.swift
//  MoviesList
//
//  Created by Daniil Markish on 04/04/2023.
//

import Combine

extension Publisher where Output == String, Failure == Never {
    func isValid(_ type: ValidationType) -> AnyPublisher<Bool, Never> {
        map { str in
            return str.isValid(type)
        }
        .eraseToAnyPublisher()
    }
    
    func validationMessage(_ type: ValidationType) -> AnyPublisher<String, Never> {
        map { str in
            return str.isEmpty ? "" :  ( str.isValid(type) ? "" : type.errorMessage )
        }
        .eraseToAnyPublisher()
    }
    
}

extension Publisher where Output == (String, String), Failure == Never {
    
    func matchPasswordMessage() -> AnyPublisher<String, Never> {
        map { str1, str2  in
            if !str1.isEmpty, !str2.isEmpty, str1 != str2 {
                return L10n.Validation.passwordMatch
            } else {
                return ""
            }
        }
        .eraseToAnyPublisher()
    }
    
    func isMatch() -> AnyPublisher<Bool, Never> {
        map { str1, str2 in
            return str1 == str2
        }
        .eraseToAnyPublisher()
    }

}
