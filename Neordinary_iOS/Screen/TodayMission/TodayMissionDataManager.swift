//
//  TodayMissionDataManager.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import Alamofire
import Combine
import Foundation

struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var code: String
    var message: String
    var provider : String?
}

struct TodayMissionResponse: Decodable {
    var id: Int
    var title: String
    var subtitle: String
    var description: String
    var point: Int
    var sortOrder: Int
    var todayActivity: Bool
    var custom: Bool
}

struct TodayMissionRequest: Encodable {
    var categoryId: Int
}

protocol TodayMissionProtocol {
    func getTodayMission() -> AnyPublisher<DataResponse<[TodayMissionResponse], NetworkError>, Never>

    func postTodayMission(id: Int) -> AnyPublisher<Void, NetworkError>
}

class TodayMission {
    static let shared: TodayMissionProtocol = TodayMission()
    private init() { }
}
extension TodayMission: TodayMissionProtocol {
    func postTodayMission(id: Int) -> AnyPublisher<Void, NetworkError> {
        let url = "https://api.neodinary.store/api/activity-histories"
        let token = Config.jwt
        let request = TodayMissionRequest(categoryId: id)
        return AF.request(url,
                          method: .post,
                          parameters: request,
                          encoder: JSONParameterEncoder(),
                          headers: ["Authorization":"Bearer \(token)"])
          
        .validate()
        .publishData()
        .tryMap { result in
            // Check the status code
            if let statusCode = result.response?.statusCode {
                print("Status Code: \(statusCode)")
                if statusCode == 200 {
                    return // Success, return
                } else {
                    
                    // Handle error based on status code
                    let backendError = result.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    if let backendError = backendError {
                        throw NetworkError(initialError: result.error!, backendError: backendError)
                    } else {
                        throw NetworkError(initialError: result.error!, backendError: nil)
                    }
                }
            } else {
                throw NetworkError(initialError: result.error!, backendError: nil)
            }
        }
        .mapError { error in
            return error as! NetworkError
        }
        .eraseToAnyPublisher()
    }
    
    func getTodayMission() -> AnyPublisher<Alamofire.DataResponse<[TodayMissionResponse], NetworkError>, Never> {
        let url = "https://api.neodinary.store/api/activities/today-mission"
        let token = "F8D12dRGr8K6Msjn4crKsOjamMOAvcwevDMMeBVQtO8lJhL" //Keychain.getKeychainValue(forKey: .accessToken) ?? ""
        return AF.request(url,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: ["Authorization":"Bearer \(token)"])
        .validate()
        .publishDecodable(type: [TodayMissionResponse].self)
        .map { response in
            response.mapError { error in
                let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                return NetworkError(initialError: error, backendError: backendError)
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
}
