//
//  TextFieldView.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import SwiftUI

struct CustomizedTextField: View {
    
    @Binding var text: String
    @Binding var isValid: Bool
    
    var title: String?
    var placeholder: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let title = title, !title.isEmpty {
                Text(title)
                    .font(.system(size: 20).bold())
                    .foregroundColor(Asset.Colors.white.uiColor)
                    .padding(.bottom)
            }
            
            field
            
        }
    }
    
    var field: some View {
        TextField(placeholder, text: $text)
            .font(.system(size: 20).bold())
            .foregroundColor(Asset.Colors.white.uiColor.opacity(0.2))
            .padding()
    }
    

    
    
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizedTextField(text: .constant(""), isValid: .constant(true),title: "Email", placeholder: "email")
            .padding()
            .background(Color.black)
    }
}
