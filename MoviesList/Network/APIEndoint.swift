//
//  APIEndoint.swift
//  MoviesList
//
//  Created by Daniil Markish on 28/03/2023.
//

import Foundation

public enum APIEndpoints {}

protocol APIEndpoint {
    
    associatedtype ResultType
    
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPRequestMethod { get }
    var headers: [String: String] { get }
    var query: [String: String] { get }
    var body: Encodable? { get }
}

extension APIEndpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "d195-37-212-57-248.eu.ngrok.io"
    }
    
    var method: HTTPRequestMethod {
        .get
    }

    var query: [String: String] {
        [:]
    }

    var headers: [String: String] {
        ["Accept": "application/json"]
    }
    
    var body: Encodable? {
        return nil
    }
    
    func url() throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        if !query.isEmpty {
            let queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            throw APIError.invalidURL
        }
        return url
    }
    
    func request() throws -> URLRequest {
        var request = URLRequest(url: try url())
        request.httpMethod = method.rawValue
        for header in headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if let body = body, let data = try? jsonEncoder.encode(body) {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        }
        
        return request
    }
    
    
    
    // MARK: - Helpers

    private var jsonEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        encoder.dateEncodingStrategy = .formatted(formatter)
        return encoder
    }
}
