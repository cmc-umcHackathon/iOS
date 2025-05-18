//
//  MyPageDataManager.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import Foundation
import Alamofire
import Combine

protocol MyPageProtocol {
    func getActivityCount() -> AnyPublisher<Int, Error>
    func getPoint() -> AnyPublisher<Int, Error>
}

class MyPage {
    static let shared: MyPageProtocol = MyPage()
    private init() { }
}
extension MyPage: MyPageProtocol {
    
    func getPoint() -> AnyPublisher<Int, any Error> {
        let url = "https://api.neodinary.store/api/my/activity-info"
        let token = Config.jwt
        return AF.request(url,
                          method: .get,
                          parameters: nil,
                          encoding : JSONEncoding.default,
                          headers: ["Authorization":"Bearer \(token)"])
        .validate()
        .publishData()
        .tryMap { result in
            guard let data = result.data else {
                throw NetworkError(initialError: result.error!, backendError: nil)
            }
            
            // Try to decode BackendError
            if let backendError = try? JSONDecoder().decode(BackendError.self, from: data) {
                throw NetworkError(initialError: AFError.createURLRequestFailed(error: backendError), backendError: backendError)
            }
            
            guard let response = Int(String(data: data, encoding: .utf8) ?? "") else {
                
                throw NetworkError(initialError: result.error!, backendError: nil)
            }
            return response
        }
        .mapError { $0 as? NetworkError ?? NetworkError(initialError: AFError.explicitlyCancelled, backendError: nil) }
        .eraseToAnyPublisher()
    }
    
    func getActivityCount() -> AnyPublisher<Int, any Error> {
        let url = "https://api.neodinary.store/api/activity-histories/count"
        let token = "F8D12dRGr8K6Msjn4crKsOjamMOAvcwevDMMeBVQtO8lJhL" //Keychain.getKeychainValue(forKey: .accessToken) ?? ""
        return AF.request(url,
                          method: .get,
                          parameters: nil,
                          encoding : JSONEncoding.default,
                          headers: ["Authorization":"Bearer \(token)"])
        .validate()
        .publishData()
        .tryMap { result in
            guard let data = result.data else {
                throw NetworkError(initialError: result.error!, backendError: nil)
            }
            
            // Try to decode BackendError
            if let backendError = try? JSONDecoder().decode(BackendError.self, from: data) {
                throw NetworkError(initialError: AFError.createURLRequestFailed(error: backendError), backendError: backendError)
            }
            
            guard let response = Int(String(data: data, encoding: .utf8) ?? "") else {
                
                throw NetworkError(initialError: result.error!, backendError: nil)
            }
            return response
        }
        .mapError { $0 as? NetworkError ?? NetworkError(initialError: AFError.explicitlyCancelled, backendError: nil) }
        .eraseToAnyPublisher()
    }
}
