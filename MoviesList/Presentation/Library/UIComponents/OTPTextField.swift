//
//  OTPTextField.swift
//  MoviesList
//
//  Created by Daniil Markish on 07/04/2023.
//

import SwiftUI
import Combine

extension OTPTextField {
    private enum Focus {
        case first
        case second
        case third
        case fourth
    }
}

struct OTPTextField: View {
    
    @Binding var text: String
    @FocusState private var inFocus: Focus?
    
    @State private var firstNumber = ""
    @State private var secondNumber = ""
    @State private var thirdNumber = ""
    @State private var fourthNumber = ""
    
    var body: some View {
        HStack {
            Group {
                TextField("", text: $firstNumber)
                    .focused($inFocus, equals: .first)
                
                
                TextField("", text: $secondNumber)
                    .focused($inFocus, equals: .second)
                
                
                TextField("", text: $thirdNumber)
                    .focused($inFocus, equals: .third)
                
                
                TextField("", text: $fourthNumber)
                    .focused($inFocus, equals: .fourth)
            } .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .font(.rubikSemiBold(35))
                .frame(width: 55, height: 60)
                .background(RoundedRectangle(cornerRadius: 15)
                    .fill(Asset.Colors.textFieldGrey.swiftUIColor))
            
        }
        
    }
}

struct OTPTextField_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextField(text: .constant(""))
    }
}
