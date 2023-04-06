//
//  UseCasesDependencies.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import Foundation
import Domain
import Data

final class UseCasesDI {
    
    // MARK: - UseCases
    
    var login: LoginUseCase {
        .init(authRepository: authorizationRepository, authDataRepository: authDataRepository)
    }
    
    // MARK: - Repositories
    
    private var authDataRepository: AuthDataRepository {
        AuthDataRepositoryImpl()
    }
    
    private var authorizationRepository: AuthorizationRepository {
        AuthorizationRepositoryImpl(apiManager: guestAPIManager)
    }
    
    // MARK: - API
    
    private var guestAPIManager: APIManager {
        GuestAPIManager(httpClient: httpClient)
    }
    
    private var userAPIManager: APIManager {
        UserAPIManager(httpClient: httpClient, authDataRepository: authDataRepository)
    }
    
    private var httpClient: HTTPClient {
        HTTPClientImpl()
    }
}
