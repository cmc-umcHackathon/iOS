//
//  InagePickerViewModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import PhotosUI
import SwiftUI

final class ImagePickerViewModel: ObservableObject {
    @Published var selectedItems: [PhotosPickerItem] = []
    @Published var images: [UIImage] = []
    
    @MainActor
    func convertItemsToImages() async {
        var images: [UIImage] = []

        for item in selectedItems {
            if let data = try? await item.loadTransferable(type: Data.self),
               let image = UIImage(data: data) {
                images.append(image)
            }
        }

        self.images = images
    }
}
