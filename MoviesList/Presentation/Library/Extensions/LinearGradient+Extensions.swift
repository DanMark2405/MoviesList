//
//  LinearGradient.swift
//  MoviesList
//
//  Created by Daniil Markish on 03/04/2023.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static let bluePurpleHorizontal = LinearGradient(colors: [Asset.Colors.mainBlue.uiColor, Asset.Colors.mainPurple.uiColor], startPoint: .leading, endPoint: .trailing)
    static let purpleBlueVertical = LinearGradient(colors: [Asset.Colors.mainBlue.uiColor, Asset.Colors.mainPurple.uiColor], startPoint: .top, endPoint: .bottom)
    static let bluePurpleDiagonal = LinearGradient(colors: [Asset.Colors.mainBlue.uiColor, Asset.Colors.mainPurple.uiColor], startPoint: .topLeading, endPoint: .bottomTrailing)
    static let gray =  LinearGradient(colors: [.gray], startPoint: .leading, endPoint: .trailing)
}
