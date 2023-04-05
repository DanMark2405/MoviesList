//
//  LoginView.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    @ObservedObject var coordinator = Coordinator()
    
    var body: some View {
        BackgroundContainer {
            VStack {
                Text("Welcome Back")
                    .font(.largeTitle.bold())
                    .foregroundStyle(LinearGradient.bluePurpleHorizontal)
                CustomizedTextField.email(text: $viewModel.email, promt: $viewModel.emailPromt)
                    .padding()
                SecureTextField(text: $viewModel.password, promt: $viewModel.passwordPromt)
                    .padding()
                Button("Login", action: {})
                    .buttonStyle(.gradient)
                    .frame(height: 55)
                    .disabled(!viewModel.isEnableButton)
                    .padding(.horizontal, 50)
                
            }.animation(.easeInOut)
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


