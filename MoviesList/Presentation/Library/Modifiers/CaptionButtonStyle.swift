//
//  CaptionButtonStyle.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct CaptionButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
    configuration.label
            .foregroundColor(.white)
            .font(.rubikBold(12))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .opacity(configuration.isPressed ? 0.9 : 1)
    }
    
}

extension ButtonStyle where Self == CaptionButtonStyle  {
    static var caption: CaptionButtonStyle { .init() }
}

