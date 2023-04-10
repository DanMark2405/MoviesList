//
//  OTPView.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import SwiftUI

struct OTPView: View {
    
    @StateObject var viewModel: OTPViewModel
    
    var body: some View {
        BackgroundVContainer {
            
            Text("Enter OTP")
                .textStyle(.largeTitle)
                .padding(.top, 50)
            
            Spacer()
            
            Asset.Images.otp.swiftUIImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 100)
            
            Spacer()
            
            Text("An 4 digit code has been sent to ***rty123@mail.com")
                .textStyle(.caption)
                .padding(.horizontal, 60)
                .padding(.bottom, 60)
          
            CustomizedTextField.email(text: $viewModel.otp, promt: $viewModel.otpPromt)
                .padding(.horizontal, 120)
            
    
            Button("Confirm", action: { viewModel.confirmAction() })
                .buttonStyle(.gradient)
                .disabled(!viewModel.isEnbledButton)
                .frame(width: 240, height: 55)
                .padding(.bottom, 30)
                .padding(.top, 120)
        }
        .backButtonHidden(false)
        .animation(.easeInOut, value: viewModel.otpPromt)
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        AppDIContainer().authorizationDI.makeOTPView(isRegister: true)
    }
}
