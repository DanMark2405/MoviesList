//
//  APIError+Localized.swift
//  MoviesList
//
//  Created by Daniil Markish on 03/04/2023.
//

import Foundation
import Data

extension APIError {
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return L10n.Error.invalidURL
        case .noResponse:
            return L10n.Error.noResponse
        case .decode:
            return L10n.Error.decodeError
        case .unknown:
            return L10n.Error.unknownError
        case .unauthorized:
            return L10n.Error.unauthorized
        case .notConnected:
            return L10n.Error.noConnection
        case .serverError(let description):
            return description.localized
        }
    }
}
