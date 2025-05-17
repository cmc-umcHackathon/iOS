//
//  CategoryViewModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categoryModel: CategoryModel = .sampleData
}
