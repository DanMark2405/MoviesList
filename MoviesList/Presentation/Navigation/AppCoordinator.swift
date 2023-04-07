//
//  AppCoordinator.swift
//  MoviesList
//
//  Created by Daniil Markish on 30/03/2023.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var rootView: RootViewType
    @Published var authPath = [AuthorizationPath]()
    
    private let appDI: AppDIContainer
    
    init(appDI: AppDIContainer) {
        self.appDI = appDI
        rootView = .login
    }
    
    @ViewBuilder func rootView(_ type: RootViewType) -> some View {
        switch type {
        case .login:
            appDI.authorizationDI.makeLoginView()
        case .tabBar:
            appDI.authorizationDI.makeUserAvatarView()
        }
    }
    
    @ViewBuilder func authViewBuilder(_ path: AuthorizationPath) -> some View {
        switch path {
        case .signUp:
            appDI.authorizationDI.makeSignUpView()
        case .otp:
            appDI.authorizationDI.makeOTPView()
        case .forgotPassword:
            appDI.authorizationDI.makeResetPasswordView()
        case .newPassword:
            appDI.authorizationDI.makeNewPasswordView()
        case .selectUserAvatar:
            appDI.authorizationDI.makeUserAvatarView()
        case .selectFavoriteGenre:
            appDI.authorizationDI.makeFavoriteGenreView()
        }
    }
    
    public func authNavigate(to path: AuthorizationPath) {
        self.authPath.append(path)
    }
    
    public func changeRootView(to type: RootViewType) {
        self.rootView = type
    }
    
}


