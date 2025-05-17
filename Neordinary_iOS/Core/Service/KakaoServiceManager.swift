//
//  KakaoServiceManager.swift
//  Ne(O)rdinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import Foundation
import KakaoSDKUser

class KakaoServiceManager {
    func signIn() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            //카카오톡이 설치되어있다면 카카오톡을 통한 로그인 진행
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                if let oauthToken = oauthToken{
                    UserApi.shared.me() {(user, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            let nickname = user?.kakaoAccount?.profile?.nickname
                            let email = user?.kakaoAccount?.email
                            let token = String(describing: oauthToken.accessToken)
                            print("nickname : \(nickname)")
                            print("email : \(email)")
                            print("oauthToken : \(oauthToken)")
                        }
                    }
                }
            }
        } else{
            //카카오톡이 설치되어있지 않다면 사파리를 통한 로그인 진행
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                print(oauthToken?.accessToken)
                print(error)
            }
        }
    }
}
