//
//  AppCoordinator.swift
//  MoviesList
//
//  Created by Daniil Markish on 30/03/2023.
//

import Foundation
import SwiftUI

public protocol AppCoordinator {
    func coordinate(to path: AppPath)
    func back()
}

class AppCoordinatorImpl: ObservableObject {

    @Published var rootView: RootPath
    @Published var authPath = [AuthorizationPath]()
    
    private let appDI: AppDIContainer
    
    init(appDI: AppDIContainer) {
        self.appDI = appDI
        rootView = .login
    }
    
    @ViewBuilder func rootView(_ type: RootPath) -> some View {
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
        case .resetPasswordOTP:
            appDI.authorizationDI.makeOTPView(isRegister: false)
        case .registerOTP:
            appDI.authorizationDI.makeOTPView(isRegister: true)
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
    

    
}

 //MARK: - Implementation AppCoordinator

extension AppCoordinatorImpl: AppCoordinator {
    public func coordinate(to path: AppPath) {
        switch path {
        case let path as AuthorizationPath:
            authPath.append(path)
        case let path as RootPath:
            rootView = path
        default: break
        }
    }
    
    public func back() {
        switch rootView {
        case .login:
            authPath.removeLast()
        case .tabBar:
            authPath.removeLast()
        }
    }
}


