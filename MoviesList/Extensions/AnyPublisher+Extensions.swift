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
            return str.isEmpty ? true : str.isValid(type)
        }
        .eraseToAnyPublisher()
    }
    
    func validate(_ type: ValidationType) -> AnyPublisher<String, Never> {
        map { str in
            return str.isEmpty ? "" :  ( str.isValid(type) ? "" : type.errorMessage )
        }
        .eraseToAnyPublisher()
    }
    
}
