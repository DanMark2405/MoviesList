//
//  LoginViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import Domain
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var emailPromt = "res"
    
    @Published var password = ""
    @Published var passwordPromt = "resept"
    
    @Published var isEnabledButton = false
    
    private let useCase: LoginUseCase
    private let appCoordinator: AppCoordinator
    
    init(useCase: LoginUseCase, appCoordinator: AppCoordinator) {
        self.useCase = useCase
        self.appCoordinator = appCoordinator
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
            .assign(to: &$isEnabledButton)
    }
    
    func forgotPasswordAction() {
        appCoordinator.authNavigate(to: .forgotPassword)
    }
    
    func signUp() {
        appCoordinator.authNavigate(to: .signUp)
    }
    
    func login() {
        appCoordinator.changeRootView(to: .tabBar)
    }
    
}



