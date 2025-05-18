//
//  BaseTarget.swift
//  Ne(O)rdinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import Foundation
import Moya

protocol BaseTarget: TargetType {}

/// 공통으로 사용하는 Target
extension BaseTarget {
    var baseURL: URL {
        guard let url = URL(string: "https://api.neodinary.store/") else {
            fatalError("URL 없어용")
        }
        return url
    }
}
