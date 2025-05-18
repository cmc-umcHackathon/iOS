//
//  PointViewModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import Foundation
import Moya

class UsePointViewModel: ObservableObject {
    @Published var usePointModel: UsePointModel = .sampleData
    @Published var isShowPopup: Bool = false
    @Published var selectedItem: PurchasableItem? = nil
    
    private let router: NavigationRouter
    let provider = MoyaProvider<UsePointAPI>(
        plugins: [
            AccessTokenPlugin { _ in "Bearer \(Config.jwt)"},
        ]
    )
    
    init(router: NavigationRouter) {
        self.router = router
    }
}

extension UsePointViewModel {
    @MainActor
    func fetchProductList() async {
        do {
            let response = try await provider.requestAsync(.fetchProduct)
            let result = try JSONDecoder().decode(APIResponse<[FetchProductResponse]>.self, from: response.data)
            let item = result.data?.map {
                return PurchasableItem(
                    id: $0.id,
                    image: $0.imgUrl,
                    title: $0.name,
                    point: $0.price
                )
            }
            usePointModel.purchasableItemList = item ?? []
        } catch {
            print("요청 또는 디코딩 실패:", error.localizedDescription)
        }
    }
    
    @MainActor
    func purchaseItem(_ item: PurchasableItem) async {
        do {
            let response = try await provider.requestAsync(.usePoint(productId: item.id))
            let result = try JSONDecoder().decode(APIResponse<EmptyData>.self, from: response.data)
            self.selectedItem = item
            self.isShowPopup = true
            print(result)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
