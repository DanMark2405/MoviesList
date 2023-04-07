//
//  RootView.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var coordinator: AppCoordinator
    var body: some View {
        switch coordinator.rootView {
        case .login:
            AuthorizationNavigationView(coordinator: coordinator)
        case .tabBar:
            AuthorizationNavigationView(coordinator: coordinator)
        }
    }
}


