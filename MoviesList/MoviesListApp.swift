//
//  MoviesListApp.swift
//  MoviesList
//
//  Created by Daniil Markish on 23/03/2023.
//

import SwiftUI

@main
struct MoviesListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
