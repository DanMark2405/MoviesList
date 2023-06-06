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
            Asset.Images.babylon.swiftUIImage
                .resizable()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            
            Text("Nickname")
                .foregroundColor(.white)
                .font(.rubikMedium(25))
            
            Text("emailmail.com")
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
            ForEach(0...10, id: \.self) { int in
                Button {
                    
                } label: {
                    MovieListCell()
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
