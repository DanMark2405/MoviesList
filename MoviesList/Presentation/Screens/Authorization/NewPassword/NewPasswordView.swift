//
//  NewPasswordView.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

struct NewPasswordView: View {
    @StateObject var viewModel: NewPasswordViewModel = NewPasswordViewModel()
    
    var body: some View {
        BackgroundVContainer(spacing: 16) {
            Spacer()
            Text("Create new \npassword")
                .textStyle(.title)
            
            Asset.Images.newPassword.swiftUIImage
            
            Text("Your new password must be different from previous used passwords")
                .textStyle(.caption)
                .multilineTextAlignment(.center)
            
            SecureTextField(text: $viewModel.password, promt: $viewModel.passwordPromt)
                .padding(.horizontal, 25)
                .padding(.top)
            
            SecureTextField("Confirm password", text: $viewModel.repeatPassword, promt: $viewModel.repeatPasswordPromt)
                .padding(.horizontal, 25)
                .padding(.top)
            
            
            Spacer()
            Button("Register", action: {})
                .buttonStyle(.gradient)
                .disabled(!viewModel.isEnabledButton)
                .frame(width: 240, height: 55)
                .padding(.bottom, 30)
        }
        .animation(.easeInOut, value: [viewModel.passwordPromt, viewModel.repeatPasswordPromt])
    }
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView()
    }
}
