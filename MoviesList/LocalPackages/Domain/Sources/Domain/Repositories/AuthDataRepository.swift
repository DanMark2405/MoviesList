//
//  File.swift
//  
//
//  Created by Daniil Markish on 29/03/2023.
//

import Foundation

public protocol AuthDataRepository {
    var token: String? { get }
    func setToken(_ token: String)
    func deleteToken()
}
