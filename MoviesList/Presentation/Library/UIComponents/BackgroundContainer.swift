//
//  BackgroundContainer.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct BackgroundContainer<Content: View> : View {
    
    private let content: () -> Content
    private let background: Color
    
    init(background: Color = Asset.Colors.backgroundColor.swiftUIColor, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.background = background
    }
    
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea()
            content()
        }
    }
    
    
}
