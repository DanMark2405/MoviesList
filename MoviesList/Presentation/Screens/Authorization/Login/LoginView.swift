//
//  LoginView.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        BackgroundVContainer {
            
            Text("Welcome Back")
                .textStyle(.largeTitle)
                .padding(.top, 50)
            
            Text("Login to your account")
                .textStyle(.caption)
            
            Spacer()
            
            Asset.Images.login.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            CustomizedTextField.email(text: $viewModel.email, promt: $viewModel.emailPromt)
                .padding(.horizontal, 25)
                .padding(.top, 32)
            
            SecureTextField(text: $viewModel.password, promt: $viewModel.passwordPromt)
                .padding(.horizontal, 25)
                .padding(.top)
            
            forgotButton
                .padding(.horizontal, 36)
                .frame(height: 20)
            
            Button("Login", action: {
                viewModel.loginAction()
            })
            .buttonStyle(.gradient)
            .disabled(!viewModel.isEnabledButton)
            .frame(width: 240, height: 55)
            .padding(.top, 100)
            
            signUp
                .frame(height: 16)
                .padding(.top, 14)
            
        }
        .animation(.easeInOut, value:
                        [viewModel.emailPromt, viewModel.passwordPromt])

    }
    
    var forgotButton: some View {
        HStack {
            Spacer()
            Button("Forgot your password", action: {
                viewModel.forgotPasswordAction()
            })
                .buttonStyle(.caption)
        }
    }
    
    var signUp: some View {
        HStack {
            Text("Don't have account?")
                .textStyle(.caption2)
            
            Button("Sign up", action: {
                viewModel.signUpAction()
            })
                .buttonStyle(.caption)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AppDIContainer().authorizationDI.makeLoginView()
    }
}

class Coordinator: ObservableObject {
    @Published var path = [AuthorizationPath]()
    @Published var isMain = false
}


