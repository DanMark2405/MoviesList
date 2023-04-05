//
//  SignUpViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import Foundation
import Combine

final class SignUpViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var emailPromt = "res"
    
    @Published var nickname = ""
    @Published var nicknamePromt = ""
    
    @Published var password = ""
    @Published var passwordPromt = "resept"
    
    @Published var repeatPassword = ""
    @Published var repeatPasswordPromt = "resept"
    
    @Published var isEnableButton = false
    
    init() {
        setup()
    }
    
    private func setup() {
        
        $nickname
            .validationMessage(.nickname)
            .assign(to: &$nicknamePromt)
        
        $email
            .validationMessage(.email)
            .assign(to: &$emailPromt)
        
        $password
            .validationMessage(.password)
            .assign(to: &$passwordPromt)
        
        $repeatPassword
            .combineLatest($password)
            .matchPasswordMessage()
            .assign(to: &$repeatPasswordPromt)
        
        Publishers.CombineLatest4( $nickname.isValid(.nickname),
                                   $email.isValid(.email),
                                   $password.isValid(.password),
                                   $repeatPassword.combineLatest($password).isMatch())
        .map { a, b, c, d in
            return a && b && c && d
        }
        .assign(to: &$isEnableButton)
        
    }
}
