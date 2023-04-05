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
        BackgroundVContainer {
            icon
                .padding(.top)
            
            Text("Welcome Back")
                .textStyle(.largeTitle)
                .padding(.top, 30)
            
            Text("Login to your account")
                .textStyle(.caption)
            
            CustomizedTextField.email(text: $viewModel.email, promt: $viewModel.emailPromt)
                .padding(.horizontal, 25)
                .padding(.top, 32)
            
            SecureTextField(text: $viewModel.password, promt: $viewModel.passwordPromt)
                .padding(.horizontal, 25)
                .padding(.top)
            
            forgotButton
                .padding(.horizontal, 36)
            
            Spacer()
            Button("Login", action: {})
                .buttonStyle(.gradient)
                .disabled(!viewModel.isEnableButton)
                .frame(width: 240, height: 55)
            
            signUp
                .frame(height: 16)
                .padding(.top, 14)
        }
    }
    
    var icon: some View {
        HStack(spacing: 0) {
            Asset.Images.appIcon.swiftUIImage
            Text("Movies\nList")
                .font(.rubikBold(30))
                .foregroundStyle(LinearGradient.bluePurpleHorizontal)
                .lineLimit(2)
        }
    }
    
    var forgotButton: some View {
        HStack {
            Button("Forgot your password", action: {})
                .buttonStyle(.caption)
            Spacer()
        }
    }
    
    var signUp: some View {
        HStack {
            Text("Don't have account?")
                .textStyle(.caption2)
            
            Button("Sign up", action: {})
                .buttonStyle(.caption)
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

class Coordinator: ObservableObject {
    @Published var path = [LoginPath]()
    @Published var isMain = false
}

