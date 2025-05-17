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
    let checkImg: String
    let title: String
    let pointNum: Int
}

extension CategoryModel {
    static let sampleData: CategoryModel = .init(categories: [
        .init(checkImg: "Category/unselectLeafIcon", title: "활동명1", pointNum: 11),
        .init(checkImg: "Category/leafIcon", title: "활동명2", pointNum: 11),
        .init(checkImg: "Category/leafIcon", title: "활동명3", pointNum: 11),
        .init(checkImg: "Category/leafIcon", title: "활동명4", pointNum: 11),
        .init(checkImg: "Category/leafIcon", title: "활동명5", pointNum: 11),
        .init(checkImg: "Category/leafIcon", title: "활동명6", pointNum: 11),
        .init(checkImg: "Category/leafIcon", title: "활동명7", pointNum: 11)
    ])
    
    static let sampleData2: CategoryModel = .init(categories: [
        .init(checkImg: "Category/unselectLeafIcon", title: "활동명1", pointNum: 11),
        .init(checkImg: "Category/leafIcon", title: "활동명2", pointNum: 11),
        .init(checkImg: "Category/leafIcon", title: "활동명3", pointNum: 11),
    ])
}
