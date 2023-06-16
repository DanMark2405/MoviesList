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
            Text("7.2")
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
            Button( action: {}) {
                HStack {
                    Text("Notes")
                    Text("2")
                        .foregroundStyle(LinearGradient.bluePurpleDiagonal)
                }
            }
                .buttonStyle(.text)
            Button("+ Add to list", action: {})
                .buttonStyle(.text)
        }
    }
    
    private var info: some View {
        VStack(spacing: 10) {
            
            Text("Babylon")
                .font(.rubikBold(40))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            HStack {
                Spacer()
                Image(systemName: "heart.fill")
                    .modifier(IconModifier())
                Text("3h 9m")
                    .textStyle(.caption)
                Spacer()
                Image(systemName: "heart.fill")
                    .modifier(IconModifier())
                Text("2022")
                    .textStyle(.caption)
                Spacer()
                
                HStack {
                    Asset.Images.play.swiftUIImage
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Asset.Colors.mainBlue.swiftUIColor)
                    
                    Text("Trailer")
                        .font(.rubikMedium(16))
                        .foregroundColor(.white)
                }.padding()
                .background(RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Asset.Colors.iconBG.swiftUIColor))
                
                Spacer()
                
            }
            HStack {
                Text("Action, Crime, Drama")
                    .textStyle(.subtitle)
                Spacer()
                
            }
            Text("An original epic set in 1920s Los Angeles led by Brad Pitt, Margot Robbie and Diego Calva, with an ensemble cast including Jovan Adepo, Li Jun Li and Jean Smart. A tale of outsized ambition and outrageous excess, it traces the rise and fall of multiple characters during an era of unbridled decadence and depravity in early Hollywood.")
                .font(.rubikRegular(16))
                .foregroundColor(Asset.Colors.textGray.swiftUIColor)
                .padding(.vertical)
            Text("Actors")
                .textStyle(.subtitle)
            
        }.padding(.horizontal)
    }
    
    private var actors: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(ActorModel.array(), id: \.self.title) { int in
                    VStack {
                        int.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .cornerRadius(27)
                        Text(int.title)
                            .textStyle(.caption)
                    }
                    .frame(width: 80)
                    .padding(.horizontal, 5)
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

struct ActorModel {
    let title: String
    let image: Image
    
    static func array() -> [ActorModel] {
        [.init(title: "Margot \nRobbie", image: Asset.Images.margot.swiftUIImage),
            .init(title: "Brad \nPitt", image: Asset.Images.brad.swiftUIImage),
         .init(title: "Jovan \nAdepo", image: Asset.Images.negr.swiftUIImage),
         .init(title: "Diego \nCalva", image: Asset.Images.diego.swiftUIImage)
        ]
    }
}
