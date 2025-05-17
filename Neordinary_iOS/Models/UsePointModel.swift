//
//  PointModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import Foundation

struct UsePointModel {
    let myPoint: Int
    let purchasableItemList: [PurchasableItem]
}

struct PurchasableItem: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let point: Int
}

extension UsePointModel {
    static let sampleData: UsePointModel = .init(
        myPoint: 331,
        purchasableItemList: [
            .init(image: "UsePoint/img1", title: "오가닉 자수 코튼 손수건", point: 260),
            .init(image: "UsePoint/img2", title: "오가닉 자수 코튼 손수건", point: 160),
            .init(image: "UsePoint/img3", title: "오가닉 자수 코튼 손수건", point: 460),
            .init(image: "UsePoint/img4", title: "오가닉 자수 코튼 손수건", point: 660),
            .init(image: "UsePoint/img5", title: "오가닉 자수 코튼 손수건", point: 280),
        ]
    )
}
