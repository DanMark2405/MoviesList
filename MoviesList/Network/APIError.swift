//
//  RequestError.swift
//  MoviesList
//
//  Created by Daniil Markish on 28/03/2023.
//

import Foundation

enum APIError: Error {
case invalidURL
case noResponse
case decode
case unknown
case unauthorized
case notConnected
case serverError(error: URLError) 
}
