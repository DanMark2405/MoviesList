//
//  SignUpView.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
    var body: some View {
        BackgroundVContainer {
            
            Spacer()
            Text("Register")
                .textStyle(.largeTitle)
                .padding(.top, 30)
            
            Text("Create your account")
                .textStyle(.caption)
            
            CustomizedTextField.nickname(text: $viewModel.nickname, promt: $viewModel.nicknamePromt)
                .padding(.horizontal, 25)
                .padding(.top, 32)
            
            CustomizedTextField.email(text: $viewModel.email, promt: $viewModel.emailPromt)
                .padding(.horizontal, 25)
                .padding(.top)
            
            SecureTextField(text: $viewModel.password, promt: $viewModel.passwordPromt)
                .padding(.horizontal, 25)
                .padding(.top)
            
            SecureTextField("Confirm password", text: $viewModel.repeatPassword, promt: $viewModel.repeatPasswordPromt)
                .padding(.horizontal, 25)
                .padding(.top)
            
            
            Spacer()
            Button("Register", action: {
                viewModel.registerAction()
            })
                .buttonStyle(.gradient)
                .disabled(!viewModel.isEnabledButton)
                .frame(width: 240, height: 55)
                .padding(.bottom, 30)
        }
        .animation(.easeInOut, value: [
            viewModel.emailPromt, viewModel.passwordPromt, viewModel.nicknamePromt, viewModel.repeatPasswordPromt
        ])
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AppDIContainer().authorizationDI.makeSignUpView()
    }
}
