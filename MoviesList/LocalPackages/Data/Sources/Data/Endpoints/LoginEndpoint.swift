//
//  LoginEndpoint.swift
//  MoviesList
//
//  Created by Daniil Markish on 28/03/2023.
//

import Foundation
import Domain

extension APIEndpoints {
    
    struct Login: APIEndpoint {
        
        var body: Encodable?
        
        typealias ResultType = LoginDTO
        
        let path = "/auth/log-in"
        let method: HTTPRequestMethod = .post
        
        init(model: Request) {
            self.body = model
        }
        
        struct Request: Encodable {
            let email: String
            let password: String
        }
        

        
        struct Data {
            let error: String
        }

    }
}


