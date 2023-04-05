//
//  ResetPassword.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @ObservedObject var viewModel: ResetPasswordViewModel = ResetPasswordViewModel()
    
    var body: some View {
        BackgroundVContainer(spacing: 16) {
            Spacer()
            Text("Reset password")
                .textStyle(.title)
            
            Asset.Images.resetPassword.swiftUIImage
            
            Text("Enter the email address associated with your account and we will send an email with code on how to reset your password")
                .textStyle(.caption)
                .multilineTextAlignment(.center)
            
            CustomizedTextField.email(text: $viewModel.email, promt: $viewModel.emailPromt)
                .padding(.horizontal, 25)
                .padding(.top)

            Spacer()
            Button("Register", action: {})
                .buttonStyle(.gradient)
                .disabled(!viewModel.isEnableButton)
                .frame(width: 240, height: 55)
                .padding(.bottom, 30)
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
