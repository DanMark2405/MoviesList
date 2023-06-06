//
//  MovieListCell.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/06/2023.
//

import SwiftUI

struct MovieListCell: View {
    var body: some View {
        HStack {
            Asset.Images.babylon.swiftUIImage
                .resizable()
                .frame(width: 60, height: 80)
                .cornerRadius(16)
            
            VStack {
                Text("Favorite")
                    .textStyle(.subtitle)
                
                Text("8 movies")
                    .textStyle(.caption2)
            }
        }
        .frame(width: 160, height: 100)
        .background(RoundedRectangle(cornerRadius: 16).fill(Asset.Colors.iconBG.swiftUIColor))
    }
}

struct MovieListCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieListCell()
    }
}
