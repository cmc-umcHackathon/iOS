//
//  APIResponse.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import Foundation

/// 빈 data 객체를 받을 때 사용
struct EmptyData: Codable {}

protocol BaseResponseProtocol: Decodable {
    var status: String { get }
    var code: String { get }
    var message: String { get }
}

struct APIResponse<T: Codable>: BaseResponseProtocol {
    let status: String
    let code: String
    let message: String
    let data: T?
}

struct FetchProductResponse: Codable {
    let id: Int64
    let name: String
    let price: Int
    let imgUrl: String
    let maxPurchaseLimit: Int
    let stockQty: Int
    let regDt: String
}

/// 현재 유효한 미션 조회
struct ValidMissionItemResponse: Codable, Identifiable {
    let id: Int64
    let title: String
    let subtitle: String
    let description: String
    let point: Int
    let sortOrder: Int
    let todayActivity: Bool
    let custom: Bool
}
