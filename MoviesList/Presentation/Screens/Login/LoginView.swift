//
//  LoginView.swift
//  MoviesList
//
//  Created by Daniil Markish on 27/03/2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    @ObservedObject var coordinator = Coordinator()
    
    var body: some View {
        Button("ask") {
            Task {
               await viewModel.load()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

class Coordinator: ObservableObject {
    @Published var path = [LoginPath]()
    @Published var isMain = false
}


