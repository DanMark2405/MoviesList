//
//  OTPView.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import SwiftUI

struct OTPView: View {
    
    @ObservedObject var viewModel: OTPViewModel
    
    var body: some View {
        BackgroundVContainer {
            
            Spacer()
            Button("Register", action: {})
                .buttonStyle(.gradient)
                .disabled(!viewModel.isEnbledButton)
                .frame(width: 240, height: 55)
                .padding(.bottom, 30)
        }
    }
}

//struct OTPView_Previews: PreviewProvider {
//    static var previews: some View {
//        OTPView()
//    }
//}
