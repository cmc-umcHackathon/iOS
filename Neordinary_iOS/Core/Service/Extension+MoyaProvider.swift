//
//  Extension+MoyaProvider.swift
//  Ne(O)rdinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import Moya

extension MoyaProvider {
    /// MoyaProvider는 async/await를 지원하지 않기 때문에 Combine Moya 사용
    func requestAsync(_ target: Target) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            self.request(target) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
