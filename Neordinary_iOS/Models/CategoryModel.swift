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
    let description: String
    let impactMessage: String
    let title: String
    let pointNum: Int
}

extension CategoryModel {
    static let sampleData: CategoryModel = .init(categories: [
        .init(
            checkImg: "Category/leafIcon",
            description: "외출 시 일회용 컵 대신 텀블러를 사용하세요.",
            impactMessage: "나무 한그루가 15분 숨쉴 수 있는 시간",
            title: "텀블러 1회 사용하기",
            pointNum: 11
        ),
        .init(
            checkImg: "Category/unselectLeafIcon",
            description: "쓰레기 분리수거 철저히 하기",
            impactMessage: "나무 한그루가 15분 숨쉴 수 있는 시간",
            title: "쓰레기 분리수거 철저히 하기",
            pointNum: 11
        ),
        .init(
            checkImg: "Category/unselectLeafIcon",
            description: "외출 시 일회용 컵 대신 텀블러를 사용하세요.",
            impactMessage: "나무 한그루가 15분 숨쉴 수 있는 시간",
            title: "음식물 쓰레기 줄이기",
            pointNum: 11
        ),
        .init(
            checkImg: "Category/unselectLeafIcon",
            description: "외출 시 일회용 컵 대신 텀블러를 사용하세요.",
            impactMessage: "나무 한그루가 15분 숨쉴 수 있는 시간",
            title: "일회용품 사용하지 않기",
            pointNum: 11
        ),
    ])
}
