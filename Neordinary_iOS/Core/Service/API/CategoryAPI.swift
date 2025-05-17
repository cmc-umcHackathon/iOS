//
//  CategoryAPI.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import Moya

enum CategoryAPI: BaseTarget {
    case fetchAllCategory
    case fetchValidMission
}

extension CategoryAPI {
    var path: String {
        switch self {
        case .fetchAllCategory: return "/api/categories"
        case .fetchValidMission: return "/api/activities/by-category"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchAllCategory, .fetchValidMission:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchAllCategory, .fetchValidMission:
            return .requestPlain
        }
    }
}
