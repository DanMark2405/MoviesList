//
//  LoginEndpoint.swift
//  MoviesList
//
//  Created by Daniil Markish on 28/03/2023.
//

import Foundation

extension APIEndpoints {
    
    struct Login: APIEndpoint {
        
        var body: Encodable?
        
        typealias ResultType = Response
        
        let path = "/auth/log-in"
        let method: HTTPRequestMethod = .post
        
        init(email: String, password: String) {
            body = Request(email: email, password: password)
        }
        
        struct Request: Encodable {
            let email: String
            let password: String
        }
        
        struct Response: Decodable {
            let token: String
            let nickname: String
            let firstname: String
            let surname: String
            let email: String
        }
        
    }
}
