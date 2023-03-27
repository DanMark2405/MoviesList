//
//  CustomizedTextFieldBackground.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import SwiftUI

struct CustomizedTextFieldBackground: View {

    let gradient = LinearGradient(colors: [
        .clear,
        Asset.Colors.textFieldGreen.uiColor,
        Asset.Colors.textFieldYellow.uiColor],
                                  startPoint: .topLeading, endPoint: .bottomTrailing)
    
    let gradient1 = LinearGradient(colors: [
        .black,
        .clear],
                                  startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        Capsule()
            .foregroundColor(.gray)
            .background(
                Capsule()
                    .stroke(gradient, lineWidth: 2)
                    .offset(x: 0.5, y: 1)
            )
            .overlay(
                Capsule()
                    .stroke(Asset.Colors.textFieldBlack.uiColor, lineWidth: 4)
                    .blur(radius: 2)
                    .offset(x: 1, y: 1)
                    .mask(Capsule().fill(gradient1))
            )
    }
}

struct CustomizedTextFieldBackground_Previews: PreviewProvider {
    static var previews: some View {
        CustomizedTextFieldBackground()
            .frame(width: 200, height: 60)
            .padding()
            .background(Color.black)
    }
}
