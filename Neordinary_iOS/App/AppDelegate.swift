//
//  AppDelegate.swift
//  Ne(O)rdinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import Foundation
import UIKit
import KakaoSDKCommon
import KakaoSDKAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        KakaoSDK.initSDK(appKey: Config.kakaoAPIKey, loggingEnable:false)
        return true
    }
}
