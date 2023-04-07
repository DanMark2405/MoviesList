//
//  SecureTextField.swift
//  MoviesList
//
//  Created by Daniil Markish on 04/04/2023.
//

import SwiftUI

extension SecureTextField {
    private enum TFFocus {
        case secure
        case plain
    }
}

struct SecureTextField: View {
    
    @Binding var text: String
    @Binding var promt: String
    
    @FocusState private var inFocus: TFFocus?
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
            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    var promtView: some View  {
        Text(promt)
            .foregroundColor(Asset.Colors.mainPurple.swiftUIColor)
            .font(.rubikSemiBold(10))
            .multilineTextAlignment(.center)
            .lineLimit(2)
    }
    
    var showHideButton: some View {
        Button {
            showPassword.toggle()
            inFocus = showPassword ? .plain : .secure
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
            .foregroundColor(Asset.Colors.mainBlue.swiftUIColor)
            .frame(width: 20, height: 20)
        }
    }
    
    var field: some View {
        HStack(spacing: 16) {
            Asset.Images.lock.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Asset.Colors.mainBlue.swiftUIColor)
                .frame(width: 20, height: 20)
            ZStack {
                TextField(placeholder, text: $text)
                    .focused($inFocus, equals: .plain)
                    .opacity(showPassword ? 1 : 0)
                SecureField(placeholder, text: $text)
                    .focused($inFocus, equals: .secure)
                    .opacity(showPassword ? 0 : 1)
            }
            .foregroundColor(.white)
            .font(.rubikRegular(18))
            .keyboardType(.asciiCapable)
            .autocorrectionDisabled(true)
            
            showHideButton
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
