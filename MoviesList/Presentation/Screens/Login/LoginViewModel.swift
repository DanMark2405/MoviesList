//
//  LoginViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import Foundation
import SwiftUI
import Domain
import Data
import Combine

final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var emailPromt = "res"
    
    @Published var password = ""
    @Published var passwordPromt = "resept"
    
    init() {
        setup()
    }
    
    func setup() {
        
        $email
            .validate(.email)
            .assign(to: &$emailPromt)
        
        $password
            .validate(.password)
            .assign(to: &$passwordPromt)
    }
    
    func load() async {
        let m = GuestAPIManager(httpClient: HTTPClientImpl())
        let rep = AuthorizationRepositoryImpl(apiManager: m)
        let u = LoginUseCase(authRepository: rep)
        try? await u.run(email: "some@email.com", password: "123")
//        let e = APIEndpoints.Login(email: "some@email.com", password: "123")
//        do {
//            let res = try await apiClient.request(e)
//            print(res)
//        } catch {
//            print(error)
//        }
        
    }
    
}



