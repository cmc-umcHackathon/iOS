//
//  AddActionView.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import SwiftUI

struct AddActionView: View {
    @ObservedObject var actionViewModel: ActionViewModel
    
    var body: some View {
        ZStack {
            Color.gray100
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
            VStack(spacing: 24) {
                TextField("실천 사항 이름", text: $actionViewModel.action.title)
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
                    .padding(.bottom, 25)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("카테고리 선택하기")
                            .font(.pretendardFont(.semiBold, size: 14))
                            .foregroundStyle(Color.gray600)
                        Spacer()
                    }
                    HStack(spacing: 16) {
                        ForEach(actionViewModel.category, id: \.self) { category in
                            Button {
                                actionViewModel.action.category = category
                            } label: {
                                Text(category)
                                    .font(.pretendardFont(.regular, size: 16))
                                    .foregroundStyle(actionViewModel.action.category == category ? .white : Color.gray600)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 12)
                            .background(actionViewModel.action.category == category ? Color.green100 : Color.gray100)
                            .cornerRadius(100)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(Color.white)
                .cornerRadius(20)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("간단한 설명")
                            .font(.pretendardFont(.semiBold, size: 14))
                            .foregroundStyle(Color.gray600)
                        Spacer()
                    }
                    TextEditor(text: $actionViewModel.action.description)
                        .customStyleEditor(placeholder: "예) 나무 한 그루가 15분 숨 쉴 수 있는 시간", userInput: $actionViewModel.action.description)
                        .frame(height: 104)
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(Color.white)
                .cornerRadius(20)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("주기 설정")
                            .font(.pretendardFont(.semiBold, size: 14))
                            .foregroundStyle(Color.gray600)
                        Spacer()
                    }
                    HStack(spacing: 16) {
                        ForEach(actionViewModel.duration, id: \.self) { duration in
                            Button {
                                actionViewModel.action.duration = duration
                            } label: {
                                Text(duration)
                                    .font(.pretendardFont(.regular, size: 16))
                                    .foregroundStyle(actionViewModel.action.duration == duration ? .white : Color.gray600)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 12)
                            .background(actionViewModel.action.duration == duration ? Color.green100 : Color.gray100)
                            .cornerRadius(100)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(Color.white)
                .cornerRadius(20)
                
                Spacer().frame(height: 49)
                
                Button {
                    if actionViewModel.activeStatus {
                        
                    }
                } label: {
                    Text("등록하기")
                        .font(.pretendardFont(.semiBold, size: 18))
                        .foregroundStyle(actionViewModel.activeStatus ? .white : Color.gray500)
                }
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(actionViewModel.activeStatus ? Color.green100 : Color.gray300)
                .cornerRadius(15)

                
            }
            .padding(.top, 24)
            .padding(.horizontal, 20)
        
            
            .customNavigationBar {
                BackButton()
            } centerView: {
                Text("실천 사항 등록")
                    .font(.pretendardFont(.semiBold, size: 18))
            }
        }

    }
}
