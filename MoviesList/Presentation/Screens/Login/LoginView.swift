//
//  LoginView.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Group {
                CustomizedTextField(text: $viewModel.email,
                                    isValid: $viewModel.isValidEmail,
                                    title: L10n.Common.email,
                                    placeholder: L10n.Common.email)
     
                
                CustomizedTextField(text: $viewModel.password,
                                    isValid: $viewModel.isValidPassword,
                                    title: L10n.Common.password,
                                    placeholder: L10n.Common.password)
            }
            .frame(height: 62)
            .padding(.bottom, 40)
            .padding(.horizontal, 35)
            
            Spacer()
        }
        .background(Asset.Colors.textFieldBlack.uiColor)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
