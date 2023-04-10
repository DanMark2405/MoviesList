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
            
            Text("Register")
                .textStyle(.largeTitle)
                .padding(.top, 50)
            
            Text("Create your account")
                .textStyle(.caption)
            
            Spacer()
            
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
                .padding(.top, 20)
            
            Button("Register", action: {
                viewModel.registerAction()
            })
            .buttonStyle(.gradient)
            .disabled(!viewModel.isEnabledButton)
            .frame(width: 240, height: 55)
            .padding(.bottom, 30)
            .padding(.top, 120)
        }
        .backButtonHidden(false)
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
