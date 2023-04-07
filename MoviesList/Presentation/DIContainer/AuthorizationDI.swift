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
    private let appCoordinator: AppCoordinator
    
    init(useCasesDI: UseCasesDI, appCoordinator: AppCoordinator) {
        self.useCasesDI = useCasesDI
        self.appCoordinator = appCoordinator
    }
    
    // MARK: - View
    
    public func makeLoginView() -> LoginView {
        let useCase = useCasesDI.login
        let viewModel = LoginViewModel(useCase: useCase, appCoordinator: appCoordinator)
        let view = LoginView(viewModel: viewModel)
        return view
    }
    
    public func makeSignUpView() -> SignUpView {
        let viewModel = SignUpViewModel()
        let view = SignUpView(viewModel: viewModel)
        return view
    }
    
    public func makeResetPasswordView() -> ResetPasswordView {
        let viewModel = ResetPasswordViewModel(appCoordinator: appCoordinator)
        let view = ResetPasswordView(viewModel: viewModel)
        return view
    }
    
    public func makeFavoriteGenreView() -> FavoriteGenreView {
        let viewModel = FavoriteGenreViewModel()
        let view = FavoriteGenreView(viewModel: viewModel)
        return view
    }
    
    public func makeUserAvatarView() -> UserAvatarView {
        let viewModel = UserAvatarViewModel()
        let view = UserAvatarView(viewModel: viewModel)
        return view
    }
    
    public func makeOTPView() -> OTPView {
        let viewModel = OTPViewModel()
        let view = OTPView(viewModel: viewModel)
        return view
    }
    
    public func makeNewPasswordView() -> NewPasswordView {
        let viewModel = NewPasswordViewModel()
        let view = NewPasswordView(viewModel: viewModel)
        return view
    }
    
    
}
