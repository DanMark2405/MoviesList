//
//  ResetPassword.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @StateObject var viewModel: ResetPasswordViewModel
    
    var body: some View {
        BackgroundVContainer() {
            Text("Reset password")
                .textStyle(.largeTitle)
                .padding(.top, 50)
            
            Spacer()
            
            Asset.Images.resetPassword.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 100)
            
            Spacer()
            Text("Enter the email address associated with your account and we will send an email with code on how to reset your password")
                .textStyle(.caption)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 60)
            
            CustomizedTextField.email(text: $viewModel.email, promt: $viewModel.emailPromt)
                .padding(.horizontal, 25)
                .padding(.top)
            
            Button("Register", action: { viewModel.confirmAction()})
                .buttonStyle(.gradient)
                .disabled(!viewModel.isEnabledButton)
                .frame(width: 240, height: 55)
                .padding(.bottom, 30)
                .padding(.top, 120)
        }
        .backButtonHidden(false)
        .animation(.easeInOut, value: viewModel.emailPromt)
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AppDIContainer().authorizationDI.makeResetPasswordView()
    }
}
