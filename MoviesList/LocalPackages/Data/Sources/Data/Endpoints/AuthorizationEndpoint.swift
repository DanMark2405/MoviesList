//
//  File.swift
//  
//
//  Created by Daniil Markish on 07/04/2023.
//

import Foundation
import Domain

extension APIEndpoints {
    
    struct Registration: APIEndpoint {
        
        var body: Encodable?
        
        typealias ResultType = Response
        
        let path = "/auth/reg"
        let method: HTTPRequestMethod = .post
        
        init(model: Request) {
            self.body = model
        }
        
        struct Request: Encodable {
            let nickname: String
            let email: String
            let password: String
        }
        
        struct Response: Decodable {
            let nickname: String
            let firstname: String
            let surname: String
            let email: String
        }
        
    }
}

extension APIEndpoints.Registration.Request {
    static func fromDomain(_ model: AuthModel) -> Self {
        .init(nickname: model.nickname,
              email: model.email,
              password: model.password)
    }
}
