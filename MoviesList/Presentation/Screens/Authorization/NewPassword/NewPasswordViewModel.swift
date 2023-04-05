//
//  NewPasswordViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import Combine

final class NewPasswordViewModel: ObservableObject {
    
    @Published var password = ""
    @Published var passwordPromt = "resept"
    
    @Published var repeatPassword = ""
    @Published var repeatPasswordPromt = "resept"
    
    @Published var isEnableButton = false
    
    init() {
        setup()
    }
    
    private func setup() {
        
        $password
            .validationMessage(.password)
            .assign(to: &$passwordPromt)
        
        $repeatPassword
            .combineLatest($password)
            .matchPasswordMessage()
            .assign(to: &$repeatPasswordPromt)
        
        Publishers.CombineLatest(
            $password.isValid(.password),
            $repeatPassword.combineLatest($password).isMatch())
        .map { a, b in
            return a && b
        }
        .assign(to: &$isEnableButton)
        
    }
}
