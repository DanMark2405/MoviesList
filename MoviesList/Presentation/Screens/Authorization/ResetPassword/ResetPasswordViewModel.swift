//
//  ResetPasswordViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import Foundation

final class ResetPasswordViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var emailPromt = "res"
    
    @Published var isEnabledButton = false
    
    private let appCoordinator: AppCoordinator
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
        setup()
    }
    
    private func setup() {
        
        $email
            .validationMessage(.email)
            .assign(to: &$emailPromt)
        
        $email
            .isValid(.email)
            .assign(to: &$isEnabledButton)
    }
    
    func confirmAction() {
        appCoordinator.coordinate(to: AuthorizationPath.otp)
    }
    
    
}
