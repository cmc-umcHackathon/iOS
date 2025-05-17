//
//  CategoryViewModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import Foundation

final class CategoryViewModel: ObservableObject {
    @Published var categoryModel: CategoryModel = .sampleData
    @Published var selectedActivity: CategoryListModel? = nil
    @Published var imagePickerManager: ImagePickerManager = .init()
    
    private let router: NavigationRouter
    
    init(router: NavigationRouter) {
        self.router = router
        // 미완료된 미션부터 보여줌
        self.selectedActivity = categoryModel.categories.first(where: { $0.isSuccess != .success })
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
    
    func updateCurrentAndMoveNext(to state: ActivityStateType) {
        guard let currentId = selectedActivity?.id else { return }
        
        if let index = categoryModel.categories.firstIndex(where: { $0.id == currentId }) {
            categoryModel.categories[index].isSuccess = state
            
            let nextIndex = index + 1
            if nextIndex < categoryModel.categories.count {
                selectedActivity = categoryModel.categories[nextIndex] // 뷰 갱신 위한 주입
            } else {
                selectedActivity = nil
            }
        }
    }
    
    func moveToHome() {
        router.pop()
    }
    
    func moveToMyPage() {
        router.push(.myPage)
    }
}
