//
//  MLSelector.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/06/2023.
//

import SwiftUI

struct MLSelector: View {
    @Binding var selected: String
    var body: some View {
        HStack(spacing: 20) {
            SelectorButton(selected: $selected, text: "Popular")
            SelectorButton(selected: $selected, text: "New")
            SelectorButton(selected: $selected, text: "Top rating")
        }
        
    }
}

struct SelectorButton: View {
    @Binding var selected: String
    var text: String
    var body: some View {
        Button {
            selected = text
        } label: {
            Text(text)
                .textStyle(selected == text ? .title : .caption)
        }

    }
}

struct MLSelector_Previews: PreviewProvider {
    static var previews: some View {
        MLSelector(selected: .constant(""))
    }
}
