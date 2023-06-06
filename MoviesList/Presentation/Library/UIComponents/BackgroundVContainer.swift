//
//  BackgroundContainer.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct BackgroundVContainer<Content: View> : View {
    
    @Environment(\.dismiss) private var dismiss
    private let content: () -> Content
    private let background: Color
    private let spacing: CGFloat
    private var isBackButtonHidden = true
    
    init(spacing: CGFloat = 0, background: Color = Asset.Colors.backgroundColor.swiftUIColor, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.background = background
        self.spacing = spacing
    }
    
    var body: some View {
        
        if isBackButtonHidden {
            ZStack {
                background
                    .ignoresSafeArea()
                VStack(spacing: spacing) {
                    content()
                }
            }
            .preferredColorScheme(.dark)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .navigationBarBackButtonHidden()
        } else {
            ZStack {
                background
                    .ignoresSafeArea()
                VStack(spacing: spacing) {
                    content()
                }
            }
            .preferredColorScheme(.dark)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .navigationBarBackButtonHidden()
            .toolbar { ToolbarItem(placement: .navigationBarLeading){ button } }
        }
        
    }
    
    private var button: some View {
        Button( action: { dismiss() }) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Asset.Colors.iconBG.swiftUIColor)
                .frame(width: 40, height: 40)
                .overlay {
                    Asset.Images.back.swiftUIImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                }
        }
        .frame(width: 40, height: 40)
        .buttonStyle(.icon)
    }
    
    public func backButtonHidden(_ isHidden: Bool = true) -> some View {
        var copy = self
        copy.isBackButtonHidden = isHidden
        return copy
    }
}
