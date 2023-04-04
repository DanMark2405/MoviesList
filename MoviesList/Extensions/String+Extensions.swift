//
//  String+Extensions.swift
//  MoviesList
//
//  Created by Daniil Markish on 03/04/2023.
//

import Foundation

// MARK: - Localization

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

// MARK: - Validation

extension String {
    func isValid(_ type: ValidationType) -> Bool {
        let regEx = type.rawValue

         let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
         return pred.evaluate(with: self)
    }
}
