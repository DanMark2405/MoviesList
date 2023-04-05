//
//  CustomTextStyle.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

enum CustomViewStyle {
    case largeTitle
    case caption
    case caption2
}

extension View {
    @ViewBuilder func textStyle(_ style: CustomViewStyle) -> some View {
        switch style {
        case .largeTitle:
            self
                .font(.rubikSemiBold(35))
                .foregroundStyle(LinearGradient.bluePurpleHorizontal)
        case .caption:
            self
                .font(.rubikMedium())
                .foregroundColor(Asset.Colors.textGray.swiftUIColor)
        case .caption2:
            self
                .font(.rubikMedium(12))
                .foregroundColor(Asset.Colors.textGray.swiftUIColor)
        }
    }
}
