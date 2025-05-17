//
//  Neordinary_iOSApp.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import SwiftUI
import KakaoSDKAuth

@main
struct Ne_O_rdinary_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var navigationRouter = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigationRouter)
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
