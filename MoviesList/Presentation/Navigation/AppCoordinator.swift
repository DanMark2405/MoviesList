//
//  AppCoordinator.swift
//  MoviesList
//
//  Created by Daniil Markish on 30/03/2023.
//

import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var rootPath: RootPath
    
    init() {
        rootPath = .login
    }
}


