//
//  NewPasswordView.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct NewPasswordView: View {
    @StateObject var viewModel: NewPasswordViewModel
    
    var body: some View {
        BackgroundVContainer() {
                Text("New password")
                    .textStyle(.largeTitle)
                    .padding(.top, 50)
            
                Spacer()
            
                Asset.Images.newPassword.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                Spacer()
            
                Text("Your new password must be different from previous used passwords")
                    .textStyle(.caption)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 60)
                
                SecureTextField(text: $viewModel.password, promt: $viewModel.passwordPromt)
                    .padding(.horizontal, 25)
                    .padding(.top)
                
                SecureTextField("Confirm password", text: $viewModel.repeatPassword, promt: $viewModel.repeatPasswordPromt)
                    .padding(.horizontal, 25)
                    .padding(.top)
            
            
            Button("Register", action: { viewModel.confirmAction() })
                .buttonStyle(.gradient)
                .disabled(!viewModel.isEnabledButton)
                .frame(width: 240, height: 55)
                .padding(.bottom, 30)
                .padding(.top, 120)
            
        }
        .animation(.easeInOut, value: [viewModel.passwordPromt, viewModel.repeatPasswordPromt])
    }
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AppDIContainer().authorizationDI.makeNewPasswordView()
    }
}
