//
//  SelectAvatarView.swift
//  MoviesList
//
//  Created by Daniil Markish on 03/04/2023.
//

import SwiftUI
import PhotosUI
import Combine

class UserAvatarViewModel: ObservableObject {
    
    @Published var selectedItem: PhotosPickerItem? = nil
    @Published var image: Image = Asset.Images.avatar.swiftUIImage
    @Published var showDeleteButton = false
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        setup()
    }
    
    private func setup() {
        $selectedItem
            .sink { [weak self] _ in
                self?.loadImage()
            }
            .store(in: &cancellable)
        
        $selectedItem
            .map { item in
                return item != nil
            }
            .assign(to: &$showDeleteButton)
        
    }
    
    func deleteImage() {
        selectedItem = nil
        image = Asset.Images.avatar.swiftUIImage
    }
    
    private func loadImage() {
        Task {
            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                await MainActor.run {
                    image = Image(data: data)
                }
            }
        }
    }
    
}
