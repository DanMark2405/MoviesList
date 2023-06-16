//
//  ProfileView.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/06/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        BackgroundVContainer {
            ScrollView(showsIndicators: false) {
                settings
                avatar
                addList
                    .padding(.bottom)
                list
            }
            .padding(.horizontal)
        }
    }
    
    private var settings: some View {
        HStack {
            Spacer()
            Button(action: {}) {
                Asset.Images.gear.swiftUIImage
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(10)
            }.buttonStyle(.icon)
        }
    }
    
    private var avatar: some View {
        VStack {
            Asset.Images.margot.swiftUIImage
                .resizable()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            
            Text("MargotRobbie")
                .foregroundColor(.white)
                .font(.rubikMedium(25))
            
            Text("margot@hollywood.com")
                .textStyle(.caption2)
        }
    }
    
    private var addList: some View {
        Button(action: {}) {
            HStack {
                Asset.Images.plus.swiftUIImage
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Asset.Colors.mainBlue.swiftUIColor)
                
                Text("Add List")
                    .textStyle(.caption)
                    
            }
            .padding()
            .frame(width: 200, height: 80)
            .background(RoundedRectangle(cornerRadius: 16).fill(Asset.Colors.iconBG.swiftUIColor))
        }
    }
    
    var gridItems: [GridItem] = [.init(.flexible()), .init(.flexible())]
    var list: some View {
        LazyVGrid(columns: gridItems, spacing: 16) {
            ForEach(ListModel.arr(), id: \.self.title) { int in
                Button {
                    
                } label: {
                    MovieListCell(list: int)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ListModel {
    let title: String
    let image: Image
    let count: String
    
    static func arr() -> [ListModel] {
        [
            .init(title: "Favorite", image: Asset.Images.favorite.swiftUIImage, count: "4 movies"),
            .init(title: "Notes", image: Asset.Images.notes.swiftUIImage, count: "10 movies"),
            .init(title: "Watched", image: Asset.Images.watched.swiftUIImage, count: "15 movies"),
            .init(title: "Watch Later", image: Asset.Images.later.swiftUIImage, count: "2 movies"),
            .init(title: "2022", image: Asset.Images.babylon.swiftUIImage, count: "5 movies"),
            .init(title: "Disgusting", image: Asset.Images.fast.swiftUIImage, count: "1 movies"),
            .init(title: "Actions", image: Asset.Images.django.swiftUIImage, count: "2 movies"),
            .init(title: "Love", image: Asset.Images.gentelmen.swiftUIImage, count: "2 movies"),
        ]
    }
}
