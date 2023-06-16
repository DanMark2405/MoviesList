//
//  MoviesListApp.swift
//  MoviesList
//
//  Created by Daniil Markish on 23/03/2023.
//

import SwiftUI

@main
struct MoviesListApp: App {
    
    let appDIContainer = AppDIContainer()
    var body: some Scene {
        WindowGroup {
            ProfileView()//RootView(coordinator: appDIContainer.appCoordinator)
        }
    }
    
}
