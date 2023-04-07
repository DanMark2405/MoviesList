//
//  AppDependency.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import Foundation


final class AppDIContainer {
    
    private let useCasesDI: UseCasesDI
    
    private(set) lazy var appCoordinator: AppCoordinator = {
        AppCoordinator(appDI: self)
    }()
    
    init() {
        useCasesDI = UseCasesDI()
    }
    
    public var authorizationDI: AuthorizationDI {
        .init(useCasesDI: useCasesDI, appCoordinator: appCoordinator)
    }
    
}
