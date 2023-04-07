//
//  TextFieldView.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import SwiftUI

extension CustomizedTextField {
    static func email(text: Binding<String>, promt: Binding<String>) -> Self {
        .init(text: text,
              promt: promt,
              placeholder: L10n.Common.email,
              image: Asset.Images.email.swiftUIImage,
              keyboardType: .emailAddress)
    }
    
    static func nickname(text: Binding<String>, promt: Binding<String>) -> Self {
        .init(text: text,
              promt: promt,
              placeholder: L10n.Common.nickname,
              image: Asset.Images.lock.swiftUIImage,
              keyboardType: .default)
    }
    
}

struct CustomizedTextField: View {
    
    @Binding var text: String
    @Binding var promt: String
    
    var placeholder: String
    var image: Image
    var keyboardType: UIKeyboardType
    
    init(text: Binding<String>, promt: Binding<String> = .constant(""), placeholder: String, image: Image, keyboardType: UIKeyboardType = .default) {
        self._text = text
        self._promt = promt
        self.placeholder = placeholder
        self.image = image
        self.keyboardType = keyboardType
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
            .foregroundColor(Asset.Colors.mainPurple.swiftUIColor)
            .font(.rubikSemiBold(10))
            .multilineTextAlignment(.center)
            .lineLimit(2)
    }
    
    var field: some View {
        HStack(spacing: 0) {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Asset.Colors.mainBlue.swiftUIColor)
                .frame(width: 20, height: 20)
                .padding(.trailing, 16)
            
            TextField(placeholder, text: $text)
                .foregroundColor(.white)
                .font(.rubikRegular(18))
                .keyboardType(keyboardType)
                .autocorrectionDisabled(true)
            
        }
        .padding(.horizontal)
        .frame(height: 55)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Asset.Colors.textFieldGrey.swiftUIColor)
        )
    }

}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizedTextField(text: .constant(""), promt: .constant(""), placeholder: "Email", image: Asset.Images.email.swiftUIImage, keyboardType: .emailAddress)
            .padding()
            .background(Color.black)
    }
}
