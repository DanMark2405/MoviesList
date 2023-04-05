//
//  Fonts.swift
//  MoviesList
//
//  Created by Daniil Markish on 05/04/2023.
//

import SwiftUI

extension Font {
    
    static func rubikBlack(_ size: CGFloat = 16) -> Font {
        return .custom("Rubik-Black", size: size)
    }
    
    static func rubikBold(_ size: CGFloat = 16) -> Font {
        return .custom("Rubik-Bold", size: size)
    }
    
    static func rubikExtraBold(_ size: CGFloat = 16) -> Font {
        return .custom("Rubik-ExtraBold", size: size)
    }
    
    static func rubikMedium(_ size: CGFloat = 16) -> Font {
        return .custom("Rubik-Medium", size: size)
    }
    
    static func rubikRegular(_ size: CGFloat = 16) -> Font {
        return .custom("Rubik-Regular", size: size)
    }
    
    static func rubikSemiBold(_ size: CGFloat = 16) -> Font {
        return .custom("Rubik-SemiBold", size: size)
    }
}
