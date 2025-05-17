//
//  TodayMissionView.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import SwiftUI

struct TodayMissionView: View {
    @ObservedObject var todayMissionViewModel: TodayMissionViewModel
    
    var body: some View {
        ZStack {
            Image(.TodayMission.illustMain)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                HeaderBar(todayMissionViewModel: todayMissionViewModel)
                
                Spacer().frame(height: 56)
                
                MissionView(todayMissionViewModel: todayMissionViewModel)
                
                Spacer().frame(height: 48)
                
                TodayMissionCardView(todayMissionViewModel: todayMissionViewModel)
                
            }
            
            if todayMissionViewModel.popup {
                PopupView(todayMissionViewModel: todayMissionViewModel)
            }
        }
        .ignoresSafeArea()
        
    }
}

fileprivate struct HeaderBar: View {
    @ObservedObject var todayMissionViewModel: TodayMissionViewModel
    
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

fileprivate struct MissionView: View {
    @ObservedObject var todayMissionViewModel: TodayMissionViewModel
    
    fileprivate var body: some View {
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
                Button {
                    todayMissionViewModel.moveToCategory()
                } label: {
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
}

fileprivate struct TodayMissionCardView: View {
    @ObservedObject var todayMissionViewModel: TodayMissionViewModel
    
    fileprivate var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 8) {
                
                Text("오늘의 실천")
                    .font(.pretendardFont(.semiBold, size: 20))
                
                Text("오늘 내가 지킨 약속, 기후가 변화해요 🍀")
                    .font(.pretendardFont(.regular, size: 14))
                    .foregroundColor(Color.gray500)
                
            }
            
            LazyVStack {
                ForEach(
                    todayMissionViewModel.missionModel.categories,
                    id: \.id
                ) { category in
                    MissionRowView(todayMissionViewModel: todayMissionViewModel, categoryListModel: category)
                }
            }
            
        }
        .padding(20)
        .frame(width: 335, alignment: .topLeading)
        .background(.white)
        .cornerRadius(20)
    }
}

fileprivate struct MissionRowView: View {
    @ObservedObject var todayMissionViewModel: TodayMissionViewModel
    let categoryListModel: CategoryListModel
    
    fileprivate var body: some View {
        
        Button {
            todayMissionViewModel.selectedMission = categoryListModel.title
            todayMissionViewModel.popup = true
        } label: {
            HStack {
                Image(.TodayMission.iconLeafGray)
                
                Text(categoryListModel.title)
                    .font(.pretendardFont(.regular, size: 16))
                    .foregroundStyle(.black)
                
                Spacer()
                
                porintView
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green300)
        )
    }
    
    private var porintView: some View {
        HStack {
            Image(.pointIcon)
            
            Text("\(categoryListModel.pointNum)")
                .font(.pretendardFont(.semiBold, size: 12))
                .foregroundStyle(.white)
        }
        .padding(.trailing, 12)
        .padding(.leading, 8)
        .padding(.vertical, 4)
        .background(
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.green200)
        )
    }
}

fileprivate struct PopupView: View {
    @ObservedObject var todayMissionViewModel: TodayMissionViewModel
    
    fileprivate var body: some View {
        ZStack {
            Color.black
                .opacity(0.7)
                .ignoresSafeArea()
                .onTapGesture {
                    todayMissionViewModel.popup = false
                }
            
            Image(.TodayMission.popupBackground)
                .resizable()
                .frame(width: 304, height: 244)
            
            VStack(spacing: 32) {
                
                Text("실천 완료")
                    .font(.pretendardFont(.semiBold, size: 16))
                    .foregroundStyle(Color.green100)
                
                Text("\"\(todayMissionViewModel.selectedMission)\"")
                    .font(.pretendardFont(.semiBold, size: 20))
                    .foregroundStyle(.black)
                
                VStack(spacing: 0) {
                    Text("멋져요! 당신의 행동이")
                    Text("오늘의 기후를 바꿨어요!🍀")
                }
                .font(.pretendardFont(.regular, size: 16))
                .foregroundStyle(Color.gray500)
            }
            .padding(.vertical, 48)
            .padding(.horizontal, 20)

        }
    }
    
}


#Preview {
    TodayMissionView(todayMissionViewModel: .init(router: NavigationRouter()))
}
