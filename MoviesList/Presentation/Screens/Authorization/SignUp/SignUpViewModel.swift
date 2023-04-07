//
//  SignUpViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import Foundation
import Combine
import Domain

final class SignUpViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var email = ""
    @Published var emailPromt = "res"
    
    @Published var nickname = ""
    @Published var nicknamePromt = ""
    
    @Published var password = ""
    @Published var passwordPromt = "resept"
    
    @Published var repeatPassword = ""
    @Published var repeatPasswordPromt = "resept"
    
    @Published var isEnabledButton = false
    
    private let useCase: RegisterUseCase
    private let appCoordinator: AppCoordinator
    
    // MARK: - Init
    
    init(useCase: RegisterUseCase, appCoordinator: AppCoordinator) {
        self.useCase = useCase
        self.appCoordinator = appCoordinator
        setup()
    }
    
    // MARK: - Actions
    
    func registerAction() {
        let model = AuthModel(nickname: nickname, email: email, password: password)
        Task {
            try? await useCase.run(model: model)
        }
    }
    
    // MARK: - Private
    
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
        .assign(to: &$isEnabledButton)
        
    }
}
