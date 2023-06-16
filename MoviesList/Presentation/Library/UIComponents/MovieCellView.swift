//
//  MovieCellView.swift
//  MoviesList
//
//  Created by Daniil Markish on 28/04/2023.
//

import SwiftUI
struct MovieModel {
    let title: String
    let rate: String
    let isFavorite: Bool
    let image: Image
    let year: String
    let jenres: String
    
    static func arr() -> [MovieModel] {
        [
            .init(title: "Pulp Fiction", rate: "8.9", isFavorite: true, image: Asset.Images.pulp.swiftUIImage, year: "1994", jenres: "Crime, Drama"),
       
            .init(title: "Django Unchained", rate: "8.4", isFavorite: false, image: Asset.Images.django.swiftUIImage, year: "2012", jenres: "Western, Drama"),
            .init(title: "The Gentlemen", rate: "7.8", isFavorite: true, image: Asset.Images.gentelmen.swiftUIImage, year: "2019", jenres: "Comedy, Action, Crime"),
            .init(title: "Babylon", rate: "7.2", isFavorite: true, image: Asset.Images.babylon.swiftUIImage, year: "2022", jenres: "Comedy, Drama, History"),
            .init(title: "Once Upon a Time in... Hollywood", rate: "7.6", isFavorite: false, image: Asset.Images.hollywood.swiftUIImage, year: "2019", jenres: "Comedy, Drama"),
           
            .init(title: "Inception", rate: "8.8", isFavorite: false, image: Asset.Images.inception.swiftUIImage, year: "2010", jenres: "Action,Adventure,Sci-Fi,Thriller")
        ]
    }
}
struct MovieCellView: View {
    @State var isFavorite = false
    var movie: MovieModel
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            movie.image
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
            
            Text(movie.title)
                .foregroundColor(.white)
                .font(.rubikMedium(18))
                .padding(.horizontal, 15)
                .padding(.top, 5)
            HStack {
                Text(movie.jenres)
                    .textStyle(.caption2)
                Text(movie.year)
                    .textStyle(.caption2)
            }.lineLimit(1)
            
            
        }
        .frame(width: 160, height: 270)
    }
    
    private var rating: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(Asset.Colors.mainBlue.swiftUIColor)
            Text(movie.rate)
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
        Button(action: {}) {
            Image(systemName: "heart.fill")
                .font(.title2)
                .padding(10)
                .foregroundColor(movie.isFavorite ? Asset.Colors.mainPurple.swiftUIColor :
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
//                MovieCellView()
//                MovieCellView()
            }
        }
    }
}
