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
    
    @Published var isEnabledButton = false
    
    private let appCoordinator: AppCoordinator
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
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
        .assign(to: &$isEnabledButton)
    }
    
    func confirmAction() {
        appCoordinator.coordinate(to: RootPath.tabBar)
    }
    
}
