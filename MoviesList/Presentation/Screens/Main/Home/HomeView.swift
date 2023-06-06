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
    }
    
    var title: some View {
        HStack {
            Text("MovieList")
                .textStyle(.title)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
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
            ForEach(0...10, id: \.self) { int in
                Button {
                    
                } label: {
                    MovieCellView()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
