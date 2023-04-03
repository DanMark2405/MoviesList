//
//  SelectAvatarView.swift
//  MoviesList
//
//  Created by Daniil Markish on 03/04/2023.
//

import SwiftUI
import PhotosUI

struct SelectAvatarView: View {
    
    @ObservedObject var viewModel = SelectAvatarViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            viewModel.image
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(LinearGradient.purpleBlueVertical, lineWidth: 5)
                        .frame(width: 200)
                }
                .overlay {
                    picker
                        .offset(y: -100)
                        .rotationEffect(.degrees(120))
                }
            
            Button("Help", action: {}) 
                .buttonStyle(.gradient)
                .padding(.horizontal, 50)
        
            Spacer()
        }
        
     
    }
    
    var picker: some View {
        PhotosPicker(selection: $viewModel.selectedItem, matching: .images) {
                Circle()
                    .fill(LinearGradient.purpleBlueVertical)
                    .frame(width: 30)
                    .overlay {
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .rotationEffect(.degrees(-120))
            
        }
    }
}

struct SelectAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        SelectAvatarView()
    }
}
