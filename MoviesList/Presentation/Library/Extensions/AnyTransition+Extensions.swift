//
//  AnyTransition+Extensions.swift
//  MoviesList
//
//  Created by Daniil Markish on 04/04/2023.
//

import SwiftUI

extension AnyTransition {
    static var promtTransition: AnyTransition {
        .asymmetric(
            insertion: .opacity,
            removal: .move(edge: .top).combined(with: .opacity)
        )
    }
}
