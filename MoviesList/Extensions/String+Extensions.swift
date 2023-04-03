//
//  String+Extensions.swift
//  MoviesList
//
//  Created by Daniil Markish on 03/04/2023.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
