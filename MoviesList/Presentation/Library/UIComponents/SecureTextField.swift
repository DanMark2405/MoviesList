//
//  SecureTextField.swift
//  MoviesList
//
//  Created by Daniil Markish on 04/04/2023.
//

import SwiftUI

struct SecureTextField: View {
    
    @Binding var text: String
    @Binding var promt: String
    @State private var showPassword = false
    private let placeholder: String
    
    init(_ placeholder: String = L10n.Common.password, text: Binding<String>, promt: Binding<String> = .constant("")) {
        self.placeholder = placeholder
        self._text = text
        self._promt = promt
    }
    
    var body: some View {
        VStack(spacing: 0) {
            field
                .padding(.bottom, 10)
            
            if !promt.isEmpty {
                promtView
                    .padding(.horizontal, 6)
                    .transition(.promtTransition)
            }
        }.animation(.easeInOut, value: promt.isEmpty)
    }
    
    var promtView: some View  {
        Text(promt)
            .foregroundColor(Asset.Colors.errorColor.swiftUIColor)
            .font(.rubikSemiBold(10))
            .multilineTextAlignment(.center)
            .lineLimit(2)
    }
    
    var field: some View {
        HStack(spacing: 16) {
            Asset.Images.lock.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(LinearGradient.bluePurpleHorizontal)
                .frame(width: 20, height: 20)
            Group {
                if showPassword {
                    TextField(placeholder, text: $text)
                } else {
                    SecureField(placeholder, text: $text)
                }
            }  .foregroundColor(.white)
                .font(.rubikRegular(18))
                .keyboardType(.asciiCapable)
            
            Button {
                showPassword.toggle()
            } label: {
                Group {
                    if showPassword {
                        Asset.Images.eyeSlash.swiftUIImage
                            .resizable()
                    } else {
                        Asset.Images.eye.swiftUIImage
                            .resizable()
                           
                    }
                }
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(LinearGradient.bluePurpleHorizontal)
                .frame(width: 20, height: 20)
            }
        }
        .padding(.horizontal)
        .frame(height: 55)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Asset.Colors.textFieldGrey.swiftUIColor)
        )
    }

}

struct SecureTextField_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextField("Password", text: .constant(""), promt: .constant(""))
            .padding()
            .background(Color.black)
    }
}
