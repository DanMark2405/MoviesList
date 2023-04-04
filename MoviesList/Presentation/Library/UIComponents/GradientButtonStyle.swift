//
//  GradientButtonStyle.swift
//  MoviesList
//
//  Created by Daniil Markish on 03/04/2023.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                configuration.label
                Spacer()
            }
            Spacer()
        }.background(isEnabled ? LinearGradient.bluePurpleHorizontal : LinearGradient.gray)
            .cornerRadius(16)
            .foregroundColor(.white)
            .font(.title2.bold())
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
    
}

extension ButtonStyle where Self == GradientButtonStyle  {
    static var gradient: GradientButtonStyle { .init() }
}

