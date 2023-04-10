//
//  FavoriteGenreViewModel.swift
//  MoviesList
//
//  Created by Daniil Markish on 06/04/2023.
//

import Combine

final class FavoriteGenreViewModel: ObservableObject {
    
    @Published var isEnabledButton = false
    
    @Published var genres = ["Adventure", "Comedy", "Action", "Thriller", "Horror", "Romantic", "Drama", "Documentary"]
    @Published var selectedGenres = Set<String>()
    
    private let appCoordinator: AppCoordinator
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
        setup()
    }
    
    func confirmAction() {
        appCoordinator.coordinate(to: RootPath.tabBar)
    }
    
    func isSelected( _ genre: String) -> Bool {
        selectedGenres.contains(genre)
    }
    
    func selectGenre(_ genre: String) {
        if selectedGenres.contains(genre) {
            selectedGenres.remove(genre)
        } else {
            selectedGenres.insert(genre)
        }
    }
    
    private func setup() {
        $selectedGenres
            .map { genres in
                return genres.count >= 3
            }
            .assign(to: &$isEnabledButton)
    }
    
    
    
    
}


