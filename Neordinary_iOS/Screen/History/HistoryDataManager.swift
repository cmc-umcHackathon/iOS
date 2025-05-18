//
//  HistoryDataManager.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import Alamofire
import Combine
import Foundation

struct HistoryResponse: Decodable {
    var historyId: Int
    var activiryId: Int
    var description: String
    var point: Int
    var attendStatus: Bool
    var regDt: Date
}


protocol HistoryProtocol {
    func getHistory() -> AnyPublisher<DataResponse<[HistoryResponse], NetworkError>, Never>
}

class History {
    static let shared: HistoryProtocol = History()
    private init() { }
}
extension History: HistoryProtocol {

    func getHistory() -> AnyPublisher<Alamofire.DataResponse<[HistoryResponse], NetworkError>, Never> {
        let url = "https://api.neodinary.store/api/activity-histories/"
        let token = "F8D12dRGr8K6Msjn4crKsOjamMOAvcwevDMMeBVQtO8lJhL" //Keychain.getKeychainValue(forKey: .accessToken) ?? ""
        return AF.request(url,
                          method: .get,
                          parameters: nil,
                          encoding: JSONEncoding.default,
                          headers: ["Authorization":"Bearer \(token)"])
        .validate()
        .publishDecodable(type: [HistoryResponse].self)
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
