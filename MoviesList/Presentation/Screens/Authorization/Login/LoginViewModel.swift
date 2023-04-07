//
//  LoginViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import Domain
import Combine

final class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var email = ""
    @Published var emailPromt = "res"
    
    @Published var password = ""
    @Published var passwordPromt = "resept"
    
    @Published var isEnabledButton = false
    
    private let useCase: LoginUseCase
    private let appCoordinator: AppCoordinator
    
    // MARK: - Init
    
    init(useCase: LoginUseCase, appCoordinator: AppCoordinator) {
        self.useCase = useCase
        self.appCoordinator = appCoordinator
        setup()
    }
    
    // MARK: - Actions
    
    func forgotPasswordAction() {
        appCoordinator.coordinate(to: AuthorizationPath.forgotPassword)
    }
    
    func signUpAction() {
        appCoordinator.coordinate(to: AuthorizationPath.signUp)
    }
    
    func loginAction() {
        Task {
            do {
                let user = try await useCase.run(email: "some@email.com", password: "123")
                appCoordinator.coordinate(to: RootPath.tabBar)
            } catch {
                
            }
        }
    }
    
    // MARK: - Private
    
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

    
}



