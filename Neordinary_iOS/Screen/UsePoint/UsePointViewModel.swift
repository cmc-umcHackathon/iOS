//
//  PointViewModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import Foundation

class UsePointViewModel: ObservableObject {
    @Published var usePointModel: UsePointModel = .sampleData
    @Published var isShowPopup: Bool = false
    @Published var selectedItem: PurchasableItem? = nil
    
    func purchaseItem(_ item: PurchasableItem) {
        if usePointModel.myPoint >= item.point {
            usePointModel.myPoint -= item.point
            selectedItem = item
            isShowPopup = true
        } else {
            print("돈 없어용")
        }
    }
}
