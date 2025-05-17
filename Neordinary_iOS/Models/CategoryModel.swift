//
//  CategoryModel.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import Foundation

struct CategoryModel {
    let categories: [CategoryListModel]
}

struct CategoryListModel: Identifiable {
    let id = UUID()
    let title: String
    let pointNum: Int
}

extension CategoryModel {
    static let sampleData: CategoryModel = .init(categories: [
        .init(title: "활동명", pointNum: 11),
        .init(title: "활동명", pointNum: 11),
        .init(title: "활동명", pointNum: 11),
        .init(title: "활동명", pointNum: 11),
        .init(title: "활동명", pointNum: 11),
        .init(title: "활동명", pointNum: 11),
        .init(title: "활동명", pointNum: 11),
    ])
}
