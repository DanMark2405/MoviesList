//
//  IconModifier.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/06/2023.
//

import Foundation
import SwiftUI

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Asset.Colors.mainBlue.swiftUIColor)
            .padding(10)
            .background(Asset.Colors.iconBG.swiftUIColor)
            .cornerRadius(15)
    }
}
