//
//  MainView.swift
//  MoviesList
//
//  Created by Daniil Markish on 28/04/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        BackgroundVContainer {
            title
                .padding(.horizontal)
            ScrollView(showsIndicators: false) {
                selector
                    .padding(.horizontal)
                list
            }
        }.animation(.easeOut, value: viewModel.selectedType)
            .overlay(alignment: .bottom) {
                tab.padding(.horizontal)
                    .frame(width: 370)
            }
    }
    
    var title: some View {
        HStack {
            Text("MovieList")
                .textStyle(.title)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .font(.title3.bold())
                    .padding()
            }
            .buttonStyle(.icon)
        }
    }
    
    var selector: some View {
        HStack {
            MLSelector(selected: $viewModel.selectedType)
            Spacer()
        }
    }
    var gridItems: [GridItem] = [.init(.flexible()), .init(.flexible())]
    var list: some View {
        LazyVGrid(columns: gridItems) {
            ForEach(MovieModel.arr(), id: \.self.title) { int in
                Button {
                    
                } label: {
                    MovieCellView( movie: int)
                }
            }
        }
    }
    
    var tab: some View {
        HStack {
            VStack {
                Asset.Images.home.swiftUIImage
                    .resizable()
                    .frame(width: 25, height: 25)
                    
                Text("Home")
                    .font(.rubikMedium(12))
            }
            .foregroundStyle(LinearGradient.bluePurpleDiagonal)
            Spacer()
            VStack {
                Asset.Images.addNote.swiftUIImage
                    .resizable()
                    .frame(width: 25, height: 25)
                    
                Text("Notes")
                    .font(.rubikMedium(12))
            }
            .foregroundColor(Asset.Colors.textGray.swiftUIColor)
            Spacer()
            VStack {
                Asset.Images.profile.swiftUIImage
                    .resizable()
                    .frame(width: 25, height: 25)
                    
                Text("Profile")
                    .font(.rubikMedium(12))
            }
            .foregroundColor(Asset.Colors.textGray.swiftUIColor)
            
        }
        .padding(.vertical)
        .padding(.horizontal, 40)
            .background(RoundedRectangle(cornerRadius: 27)
                .foregroundColor(Asset.Colors.backgroundColor.swiftUIColor))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
