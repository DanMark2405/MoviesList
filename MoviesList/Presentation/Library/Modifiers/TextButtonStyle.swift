//
//  TextButtonStyle.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/06/2023.
//

import SwiftUI

struct TextButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(12)
            .background(Asset.Colors.iconBG.swiftUIColor)
            .cornerRadius(15)
            .foregroundColor(.white)
            .font(.rubikMedium(18))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
    
}

extension ButtonStyle where Self == TextButtonStyle  {
    static var text: TextButtonStyle { .init() }
}
