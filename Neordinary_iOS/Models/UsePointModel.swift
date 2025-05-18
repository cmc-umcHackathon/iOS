//
//  PointModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import Foundation

struct UsePointModel {
    var myPoint: Int
    var purchasableItemList: [PurchasableItem]
}

struct PurchasableItem: Identifiable {
    let id: Int64
    let image: String
    let title: String
    let point: Int
}

extension UsePointModel {
    static let sampleData: UsePointModel = .init(
        myPoint: 331,
        purchasableItemList: [
            .init(id: 9007199254740991, image: "UsePoint/img1", title: "오가닉 자수 코튼 손수건", point: 260)
        ]
    )
}
