//
//  SignInViewModel.swift
//  Ne(O)rdinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import Foundation
import KakaoSDKUser

class SignInViewModel: ObservableObject {
    var kakaoServiceManager = KakaoServiceManager()
    
    // MARK: 카카오 로그인
    func signInWithKakao() {
        kakaoServiceManager.signIn()
    }
}
