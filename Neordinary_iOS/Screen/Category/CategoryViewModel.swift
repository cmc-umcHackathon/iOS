//
//  CategoryViewModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categoryModel: CategoryModel = .sampleData
    @Published var selectedActivity: CategoryListModel? = nil
    
    init() {
        selectedActivity = categoryModel.categories.first(where: { $0.isSuccess != .success })
    }
    
    var headerButtonState: ActivityStateType {
        switch selectedActivity?.isSuccess {
        case .success:
            return .success
        case .fail:
            return .fail
        default:
            return .defaultValue
        }
    }
}
