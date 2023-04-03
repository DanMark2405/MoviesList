//
//  Image+Extension.swift
//  MoviesList
//
//  Created by Daniil Markish on 03/04/2023.
//

import Foundation
import SwiftUI

extension Image {
    
    init(data: Data) {
        let uiImage = UIImage(data: data) ?? UIImage()
        self.init(uiImage: uiImage)
    }
}

