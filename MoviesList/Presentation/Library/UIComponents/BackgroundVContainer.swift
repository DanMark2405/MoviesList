//
//  BackgroundContainer.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct BackgroundVContainer<Content: View> : View {
    
    private let content: () -> Content
    private let background: Color
    private let spacing: CGFloat
    
    init(spacing: CGFloat = 0, background: Color = Asset.Colors.backgroundColor.swiftUIColor, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.background = background
        self.spacing = spacing
    }
    
    var body: some View {
        ZStack {
            background
                .ignoresSafeArea()
            VStack(spacing: spacing) {
                content()
            }
        }.preferredColorScheme(.dark)
            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    
}
