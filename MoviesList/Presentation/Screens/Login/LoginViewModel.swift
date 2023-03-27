//
//  LoginViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var isValidEmail = true
    
    @Published var password = ""
    @Published var isValidPassword = true
    
}
