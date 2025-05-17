//
//  UsePointAPI.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import Moya

enum UsePointAPI: BaseTarget {
    case usePoint(productId: Int)
    case fetchProduct
    case featchUserAllPoint
}

extension UsePointAPI {
    var path: String {
        switch self {
        case .usePoint: return "/api/products/purchase"
        case .fetchProduct: return "/api/products"
        case .featchUserAllPoint: return "/api/my/activity-info"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .usePoint: return .post
        case .fetchProduct, .featchUserAllPoint:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .usePoint(let productId): return .requestJSONEncodable(productId)
        case .fetchProduct, .featchUserAllPoint:
            return .requestPlain
        }
    }
}
