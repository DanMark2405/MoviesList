//
//  MovieDetailView.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/06/2023.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject var viewModel = MovieDetailViewModel()
    var body: some View {
        BackgroundVContainer {
            ScrollView(showsIndicators: false) {
                Asset.Images.babylon.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(alignment: .bottomLeading) {
                        rating.padding()
                    }
                    .overlay(alignment: .bottomTrailing) {
                        buttons.padding()
                    }
                
                info
                
                actors
                    .padding()
                    .padding(.bottom, 50)
            }.ignoresSafeArea()
        }
    }
    
    private var rating: some View {
        HStack(spacing: 4) {
            Image(systemName: "star.fill")
                .foregroundColor(Asset.Colors.mainBlue.swiftUIColor)
            Text("9.8")
                .foregroundColor(.white)
                .font(.rubikMedium(18))
        }
        .foregroundColor(.white)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Asset.Colors.iconBG.swiftUIColor)
        )
    }
    
    private var buttons: some View {
        VStack(alignment: .trailing) {
            Button("Notes", action: {})
                .buttonStyle(.text)
            Button("Add to list", action: {})
                .buttonStyle(.text)
        }
    }
    
    private var info: some View {
        VStack(spacing: 10) {
            
            Text("Avatar")
                .font(.rubikBold(40))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            HStack {
                Spacer()
                Image(systemName: "heart.fill")
                    .modifier(IconModifier())
                Text("2h 25m")
                    .textStyle(.caption)
                Spacer()
                Image(systemName: "heart.fill")
                    .modifier(IconModifier())
                Text("2022")
                    .textStyle(.caption)
                Spacer()
            }
            
            Text("Action, Crime, Drama")
                .textStyle(.subtitle)
            
            Text("Joker is an original, standalone story. Arthur Fleck (Joaquin Phoenix), a man disregarded by society, is not only a gritty character study, but also a broader cautionary tale.Standalone story. Arthur Fleck (Joaquin Phoenix), a man disregarded by society, is not only a gritty character study,")
                .font(.rubikRegular(16))
                .foregroundColor(Asset.Colors.textGray.swiftUIColor)
            Text("Actors")
                .textStyle(.subtitle)
            
        }.padding(.horizontal)
    }
    
    private var actors: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0...10, id: \.self) { int in
                    VStack {
                        Asset.Images.babylon.swiftUIImage
                            .resizable()
                            .frame(height: 100)
                            .cornerRadius(27)
                        Text("Margot Robbie")
                            .textStyle(.caption)
                    }
                    .frame(width: 80)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
