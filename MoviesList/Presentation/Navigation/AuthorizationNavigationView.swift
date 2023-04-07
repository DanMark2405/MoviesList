//
//  LoginNavigationView.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import SwiftUI



struct AuthorizationNavigationView: View {
    
    @StateObject var coordinator: AppCoordinatorImpl
    
    var body: some View {
        NavigationStack(path: $coordinator.authPath) {
            coordinator.rootView(.login)
                .navigationDestination(for: AuthorizationPath.self) { path in
                    coordinator.authViewBuilder(path)
                }
        }
       
    }
}

