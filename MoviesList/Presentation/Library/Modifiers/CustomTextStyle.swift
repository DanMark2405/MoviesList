//
//  CustomTextStyle.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

enum CustomViewStyle {
    case largeTitle
    case title
    case caption
    case caption2
    case subtitle
}

extension View {
    @ViewBuilder func textStyle(_ style: CustomViewStyle) -> some View {
        switch style {
        case .largeTitle:
            self
                .font(.rubikSemiBold(35))
                .foregroundStyle(LinearGradient.bluePurpleHorizontal)
                .multilineTextAlignment(.center)
        case .caption:
            self
                .font(.rubikMedium())
                .foregroundColor(Asset.Colors.textGray.swiftUIColor)
                .multilineTextAlignment(.center)
        case .caption2:
            self
                .font(.rubikMedium(12))
                .foregroundColor(Asset.Colors.textGray.swiftUIColor)
        case .title:
            self
                .font(.rubikSemiBold(25))
                .foregroundStyle(LinearGradient.bluePurpleHorizontal)
                .multilineTextAlignment(.center)
        case .subtitle:
            self
                .font(.rubikMedium(18))
                .foregroundStyle(.white)
        }
    }
}
