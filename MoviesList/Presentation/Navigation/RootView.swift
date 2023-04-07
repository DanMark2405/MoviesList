//
//  RootView.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import SwiftUI

struct RootView: View {
    @StateObject var coordinator: AppCoordinatorImpl
    var body: some View {
        switch coordinator.rootView {
        case .login:
            AuthorizationNavigationView(coordinator: coordinator)
        case .tabBar:
            UserAvatarView()
        }
    }
}


