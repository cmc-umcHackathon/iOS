//
//  TodayMissionView.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import SwiftUI

struct TodayMissionView: View {
    var body: some View {
        VStack {
                HeaderBar(categoryViewModel: categoryViewModel)
                
                Spacer().frame(height: 24)
            
            VStack(spacing: 30) {
                HStack(spacing: 67) {
                    VStack(spacing: 4) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 120, height: 88)
                            .background(
                                Image(.TodayMission.illustCart)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 88)
                                    .clipped()
                            )
                        Text("소비")
                            .font(.pretendardFont(.semiBold, size: 14))
                            .customeStroke(color: Color.white, width: 1)
                    }
                    VStack(spacing: 4) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 61.24454, height: 114.12398)
                            .background(
                                Image(.TodayMission.illustTumbler)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 61.24454116821289, height: 114.12397766113281)
                                    .clipped()
                            )
                            .rotationEffect(Angle(degrees: -5.41))
                        Text("생활 습관")
                            .font(.pretendardFont(.semiBold, size: 14))
                            .customeStroke(color: Color.white, width: 1)
                    }
                }
                HStack(spacing: 49) {
                    VStack(spacing: 4) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 90.18423, height: 116.70899)
                            .background(
                                Image(.TodayMission.illustFlag)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 90.1842269897461, height: 116.70899200439453)
                                    .clipped()
                            )
                            .rotationEffect(Angle(degrees: 10.77))
                        Text("사회 활동")
                            .font(.pretendardFont(.semiBold, size: 14))
                            .customeStroke(color: Color.white, width: 1)
                    }
                    VStack(spacing: 4) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 120, height: 112)
                            .background(
                                Image(.TodayMission.illustCharacter)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 112)
                                    .clipped()
                            )
                        Text("이동")
                            .font(.pretendardFont(.semiBold, size: 14))
                            .customeStroke(color: Color.white, width: 1)
                    }
                }
            }
            
        }
        .background(Color.gray100)
    }
}
fileprivate struct HeaderBar: View {
    @ObservedObject var categoryViewModel: CategoryViewModel
    
    fileprivate var body: some View {
        HStack {
            Button {
                print("Home")
            } label: {
                Image(.TodayMission.iconHomeWhite)
            }
            
            Spacer()
            
            Button {
                print("My")
            } label: {
                Image(.TodayMission.iconPersonWhite)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct TodayMissionCardView: View {
    @State var items = ["활동명", "활동명", "활동명"]
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(spacing: 8) {
                Text("오늘의 실천")
                    .font(.pretendardFont(.semiBold, size: 20))
                Text("오늘 내가 지킨 약속, 기후가 변화해요 🍀")
                    .font(.pretendardFont(.regular, size: 14))
                    .foregroundColor(Color.gray500)
            }
            
        }
        .padding(20)
        .frame(width: 335, alignment: .topLeading)
        .background(.white)
        .cornerRadius(20)
    }
}


#Preview {
    TodayMissionCardView()
}
