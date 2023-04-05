//
//  IconButtonStyle.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct IconButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Asset.Colors.iconBG.swiftUIColor)
            .cornerRadius(15)
            .foregroundStyle(LinearGradient.purpleBlueVertical)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
    
}

extension ButtonStyle where Self == IconButtonStyle  {
    static var icon: IconButtonStyle { .init() }
}
