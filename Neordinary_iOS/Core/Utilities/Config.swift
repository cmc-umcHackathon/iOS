//
//  Config.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import Foundation

enum Config {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist 없음")
        }
        return dict
    }()
    
    static let kakaoAPIKey: String = {
        guard let apiKey = Config.infoDictionary["KAKAO_NATIVE_APP_KEY"] as? String else {
            fatalError()
        }
        print(apiKey)
        return apiKey
    }()
}
