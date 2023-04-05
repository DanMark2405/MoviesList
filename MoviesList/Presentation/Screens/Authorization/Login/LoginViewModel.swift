//
//  LoginViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import Foundation
import SwiftUI
import Domain
import Data
import Combine
import UIKit

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var emailPromt = "res"
    
    @Published var password = ""
    @Published var passwordPromt = "resept"
    
    @Published var isEnableButton = false
    
    init() {
        setup()
    }
    
    private func setup() {
        
        $email
            .validationMessage(.email)
            .assign(to: &$emailPromt)
        
        $password
            .validationMessage(.password)
            .assign(to: &$passwordPromt)
        
        $email.isValid(.email)
            .combineLatest($password.isValid(.password))
            .map { a, b in
                return a && b
            }
            .assign(to: &$isEnableButton)
    }
    
    func login() {
        
    }
    
}



