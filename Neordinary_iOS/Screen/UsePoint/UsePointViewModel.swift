//
//  PointViewModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import Foundation
import Moya

class UsePointViewModel: ObservableObject {
    @Published var usePointModel = UsePointModel(
        myPoint: 0,
        purchasableItemList: [
            .init(image: "UsePoint/img1", title: "오가닉 자수 코튼 손수건", point: 260),
        ]
    )
    @Published var isShowPopup: Bool = false
    @Published var selectedItem: PurchasableItem? = nil
    
    private let router: NavigationRouter
    let provider = MoyaProvider<UsePointAPI>(
        plugins: [
            AccessTokenPlugin { _ in "Bearer F8D12dRGr8K6Msjn4crKsOjamMOAvcwevDMMeBVQtO8lJhL" },
        ]
    )
    
    init(router: NavigationRouter) {
        self.router = router
    }
    
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

extension UsePointViewModel {
    func fetchProductList() async {
        do {
            let response = try await provider.requestAsync(.fetchProduct)
            let result = try JSONDecoder().decode(APIResponse<[FetchProductResponse]>.self, from: response.data)
            let item = result.data?.map {
                return PurchasableItem(image: $0.imgUrl, title: $0.name, point: $0.price)
            }
            usePointModel.purchasableItemList = item ?? []
        } catch {
            print("요청 또는 디코딩 실패:", error.localizedDescription)
        }
    }
    
    func fetchUserAllPoint() async {
        do {
            let response = try await provider.requestAsync(.featchUserAllPoint)
            let result = try JSONDecoder().decode(APIResponse<Int>.self, from: response.data)
            let point = result.data ?? 0
            usePointModel.myPoint = point
            print("point: \(point)")
        } catch {
            print("요청 또는 디코딩 실패:", error.localizedDescription)
        }
    }
}
