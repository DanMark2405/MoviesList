//
//  MovieListCell.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/06/2023.
//

import SwiftUI

struct MovieListCell: View {
    var list: ListModel
    var body: some View {
        HStack {
            list.image
                .resizable()
                .frame(width: 60, height: 80)
                .cornerRadius(16)
            
            VStack {
                Text(list.title)
                    .textStyle(.subtitle)
                
                Text(list.count)
                    .textStyle(.caption2)
            }
        }
        .frame(width: 160, height: 100)
        .background(RoundedRectangle(cornerRadius: 16).fill(Asset.Colors.iconBG.swiftUIColor))
    }
}

struct MovieListCell_Previews: PreviewProvider {
    static var previews: some View {
        Text("")//MovieListCell()
    }
}
