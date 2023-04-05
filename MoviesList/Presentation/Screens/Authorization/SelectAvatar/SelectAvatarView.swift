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
        BackgroundVContainer(spacing: 16) {
            Spacer()
            
            Text("Set a photo for your profile")
                .textStyle(.title)
                .padding(.horizontal, 50)
            
            viewModel.image
                .resizable()
                .frame(width: 270, height: 270)
                .clipShape(Circle())
                .overlay {
                    picker
                        .offset(y: -135)
                        .rotationEffect(.degrees(140))
                }
                .overlay {
                    Button(action: { viewModel.deleteImage() }) {
                        Asset.Images.lock.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 20)
                            .frame(width: 40, height: 40)
                    }
                    .buttonStyle(.icon)
                    .disabled(!viewModel.showDeleteButton)
                    .opacity(viewModel.showDeleteButton ? 1 : 0)
                    .rotationEffect(.degrees(140))
                    .offset(y: -135)
                    .rotationEffect(.degrees(-140))
                }
                
            
                Spacer()
            Button("Continue", action: {})
                .buttonStyle(.gradient)
                .frame(width: 240, height: 55)
                .padding(.bottom, 30)

        }
    }
    
    var picker: some View {
        PhotosPicker(selection: $viewModel.selectedItem, matching: .images) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Asset.Colors.iconBG.swiftUIColor)
                .frame(width: 40, height: 40)
                .overlay {
                    Image(systemName: "pencil")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 20)
                        .foregroundStyle(LinearGradient.purpleBlueVertical)
                }
        }.rotationEffect(.degrees(-140))
    }
}

struct SelectAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        SelectAvatarView()
    }
}
