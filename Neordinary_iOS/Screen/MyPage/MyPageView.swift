//
//  MyPageView.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import SwiftUI

struct MyPageView: View {
    @ObservedObject var myPageViewModel: MyPageViewModel
    
    var body: some View {
        VStack {
            TopInformation(myPageViewModel: myPageViewModel)
            
            Spacer()
            
            EarthImage(myPageViewModel: myPageViewModel)
            
            Spacer()
            
            InformationView(myPageViewModel: myPageViewModel)
                .padding(.horizontal, 20)
            
            CardView(myPageViewModel: myPageViewModel)
                .padding(.horizontal, 20)
            
        }
        .onAppear {
            myPageViewModel.getPoint()
            myPageViewModel.getActivityCount()
        }
        .customNavigationBar {
            BackButton()
        } centerView: {
            Text("마이 페이지")
                .font(.pretendardFont(.semiBold, size: 18))
                .foregroundStyle(.black)
        }

    }
}

fileprivate struct TopInformation: View {
    @ObservedObject var myPageViewModel: MyPageViewModel
    
    fileprivate var body: some View {
        ZStack {
            switch myPageViewModel.earthStatus {
            case .health:
                Image(.MyPage.illustEarthTop1)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                Text("지구가 매우 건강해요! 이 상태를 유지해요!")
            case .normal:
                Image(.MyPage.illustEarthTop2)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                Text("기온이 점점 오르고 있어요! 실천을 멈추지 마세요")
            case .worst:
                Image(.MyPage.illustEarthTop3)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                Text("지구가 위태로워요.. 당신의 실천이 절실해요..")
            }
        }
        .font(.pretendardFont(.semiBold, size: 16))
        .foregroundStyle(.white)
    }
}

fileprivate struct EarthImage: View {
    @ObservedObject var myPageViewModel: MyPageViewModel
    
    fileprivate var body: some View {
        ZStack {
            switch myPageViewModel.earthStatus {
            case .health:
                Image(.MyPage.illustEarth1)
            case .normal:
                Image(.MyPage.illustEarth2)
            case .worst:
                Image(.MyPage.illustEarth3)
            }
        }
        .font(.pretendardFont(.semiBold, size: 16))
        .foregroundStyle(.white)
    }
}

fileprivate struct InformationView: View {
    @ObservedObject var myPageViewModel: MyPageViewModel
    
    fileprivate var body: some View {
        HStack(spacing: 72) {
            Button {
                
            } label: {
                VStack(spacing: 16) {
                    Text("보유 포인트")
                        .font(.pretendardFont(.regular, size: 14))
                        .foregroundStyle(Color.gray600)
                    HStack {
                        Text("\(myPageViewModel.point)")
                            .font(.pretendardFont(.semiBold, size: 42))
                        Text("P")
                            .font(.pretendardFont(.regular, size: 16))
                    }
                    .foregroundStyle(Color.green100)
                }
            }

            Button {
                
            } label: {
                VStack(spacing: 16) {
                    Text("실천 횟수")
                        .font(.pretendardFont(.regular, size: 14))
                        .foregroundStyle(Color.gray600)
                    HStack {
                        Text("\(myPageViewModel.actionCount)")
                            .font(.pretendardFont(.semiBold, size: 42))
                        Text("번")
                            .font(.pretendardFont(.regular, size: 16))
                    }
                    .foregroundStyle(Color.green100)
                }
            }
        }
        .padding(.top, 24)
        .padding(.bottom, 32)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: Color.gray100, radius: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .inset(by: 0.5)
                .stroke(Color.gray100, lineWidth: 1)
        )
    }
}

fileprivate struct CardView: View {
    @ObservedObject var myPageViewModel: MyPageViewModel
    
    fileprivate var body: some View {
        HStack {
            Button {
                //
            } label: {
                VStack(alignment: .leading, spacing: 13) {
                    Image(.MyPage.iconPaper)
                    Text("실천 이력")
                        .font(.pretendardFont(.semiBold, size: 16))
                        .foregroundStyle(.black)
                    Spacer()
                    HStack {
                        Spacer()
                        Image(.MyPage.iconForward)
                    }
                }
            }
            .padding(.all, 20)
            .frame(maxWidth: .infinity)
            .frame(height: 160)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: Color.gray100, radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .inset(by: 0.5)
                    .stroke(Color.gray100, lineWidth: 1)
            )
            
            Button {
                myPageViewModel.moveToUsePointView()
            } label: {
                VStack(alignment: .leading, spacing: 13) {
                    Image(.TodayMission.iconPoint)
                    Text("포인트 사용")
                        .font(.pretendardFont(.semiBold, size: 16))
                        .foregroundStyle(.black)
                    Spacer()
                    HStack {
                        Spacer()
                        Image(.MyPage.iconForward)
                    }
                }
            }
            .padding(.all, 20)
            .frame(maxWidth: .infinity)
            .frame(height: 160)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: Color.gray100, radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .inset(by: 0.5)
                    .stroke(Color.gray100, lineWidth: 1)
            )
        }
    }
}


#Preview {
    MyPageView(myPageViewModel: .init(router: NavigationRouter()))
}
