//
//  GradientButtonStyle.swift
//  MoviesList
//
//  Created by Daniil Markish on 03/04/2023.
//

import Foundation
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label
            Spacer()
        }
            .padding()
            .background(LinearGradient.bluePurpleHorizontal)
            .cornerRadius(16)
            .foregroundColor(.white)
            .font(.title.bold())
    }

}

extension ButtonStyle where Self == GradientButtonStyle  {
    static var gradient: GradientButtonStyle { .init() }
}

