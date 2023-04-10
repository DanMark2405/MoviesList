//
//  FavoriteGenreView.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import SwiftUI

struct FavoriteGenreView: View {
    @StateObject var viewModel: FavoriteGenreViewModel
    
    var body: some View {
        
        BackgroundVContainer {
            
            Text("Choise genres")
                .textStyle(.largeTitle)
                .padding(.top, 50)
            
            Text("Сhoose your favorite genres")
                .textStyle(.caption)
            
            Spacer()
            
            tagView
                .padding(.horizontal, 30)
            
            Spacer()
            Button("Confirm", action: { viewModel.confirmAction() })
                .buttonStyle(.gradient)
                .disabled(!viewModel.isEnabledButton)
                .frame(width: 240, height: 55)
                .padding(.bottom, 30)
        }.backButtonHidden(false)
    }
    
    var tagView: some View {
        TagFlowLayout(spacing: 12) {
            ForEach(viewModel.genres, id: \.self) { genre in
                Button(action: {
                    viewModel.selectGenre(genre)
                }) {
                    Text(genre)
                        .font(.rubikRegular(14))
                        .foregroundColor(.white)
                        .padding(.horizontal, 25)
                        .frame(height: 35)
                        .background(
                            RoundedRectangle(cornerRadius: .infinity)
                                .fill(
                                    viewModel.isSelected(genre) ?
                                    LinearGradient.bluePurpleHorizontal
                                    : LinearGradient.forColor(Asset.Colors.iconBG.swiftUIColor)
                                )
                        )
                        .animation(.easeInOut(duration: 1), value: viewModel.selectedGenres)
                }
            }
        }
    }
}



struct FavoriteGenreView_Previews: PreviewProvider {
    static var previews: some View {
        AppDIContainer().authorizationDI.makeFavoriteGenreView()
    }
}

