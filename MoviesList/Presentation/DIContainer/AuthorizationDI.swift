//
//  AuthorizationDI.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import Foundation
import Domain
import SwiftUI

final class AuthorizationDI {
    
    private let useCasesDI: UseCasesDI
    
    init(useCasesDI: UseCasesDI) {
        self.useCasesDI = useCasesDI
    }
    
    // MARK: - View
    
    public func makeLoginView() -> LoginView {
        let useCase = useCasesDI.login
        let viewModel = LoginViewModel(useCase: useCase)
        let view = LoginView(viewModel: viewModel)
        return view
    }
    
    public func makeSignUpView() -> SignUpView {
        let viewModel = SignUpViewModel()
        let view = SignUpView(viewModel: viewModel)
        return view
    }
    
    public func makeResetPasswordView() -> ResetPasswordView {
        let viewModel = ResetPasswordViewModel()
        let view = ResetPasswordView(viewModel: viewModel)
        return view
    }
    
    public func makeFavoriteGenreView() -> FavoriteGenreView {
        let viewModel = FavoriteGenreViewModel()
        let view = FavoriteGenreView(viewModel: viewModel)
        return view
    }
    
    public func makeUserAvatarView() -> UserAvatarView {
        
    }
    
    
}
