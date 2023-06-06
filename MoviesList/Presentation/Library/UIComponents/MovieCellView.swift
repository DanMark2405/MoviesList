//
//  MovieCellView.swift
//  MoviesList
//
//  Created by Daniil Markish on 28/04/2023.
//

import SwiftUI

struct MovieCellView: View {
    @State var isFavorite = false
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Asset.Images.babylon.swiftUIImage
                .resizable()
                .cornerRadius(27)
                .overlay(alignment: .topLeading) {
                    rating
                        .padding(10)
                }
                .overlay(alignment: .bottomTrailing) {
                    like
                        .padding(10)
                    
                }
            
            Text("Babylon")
                .foregroundColor(.white)
                .font(.rubikMedium(18))
                .padding(.horizontal, 15)
                .padding(.top, 5)
            HStack {
                Text("Comedy, Drama")
                    .textStyle(.caption2)
                Text("2022")
                    .textStyle(.caption2)
            }.lineLimit(1)
            
            
        }
        .frame(width: 160, height: 270)
    }
    
    private var rating: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(Asset.Colors.mainBlue.swiftUIColor)
            Text("9.8")
                .font(.rubikMedium(12))
        }
        .foregroundColor(.white)
        .padding(.vertical, 5)
        .padding(.horizontal, 7)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.black.opacity(0.7))
        )
    }
    
    private var like: some View {
        Button(action: {isFavorite.toggle()}) {
            Image(systemName: "heart.fill")
                .font(.title2)
                .padding(10)
                .foregroundColor(isFavorite ? Asset.Colors.mainPurple.swiftUIColor :
                                    Asset.Colors.textGray.swiftUIColor)
        }
        .buttonStyle(.icon)
    }
   
}

struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            HStack {
                MovieCellView()
                MovieCellView()
            }
        }
    }
}
