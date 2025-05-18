//
//  HistoryView.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var historyViewModel: HistoryViewModel
    
    var body: some View {
        ZStack {
            Color.gray100
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(historyViewModel.histories) { history in
                        HistoryListView(historyModel: history)
                    }
                }
                .padding(.top, 24)
            }
            .customNavigationBar (
                centerView: {
                    Text("실천 이력")
                        .font(.pretendardFont(.semiBold, size: 18))
                },
                leftView: {
                    BackButton()
                },
                rightView: {
                    Image(.History.iconPen)
                })
        }
        .onAppear {
            historyViewModel.getHistory()
        }

    }
}

fileprivate struct HistoryListView: View {
    let historyModel: HistoryModel
    
    fileprivate var body: some View {
        VStack {
            HStack {
                Text(historyModel.date)
                    .font(.pretendardFont(.semiBold, size: 14))
                    .foregroundStyle(Color.gray500)
                Spacer()
            }
            .padding(.bottom, 16)
            LazyVStack(spacing:12) {
                ForEach(historyModel.histories,
                        id: \.id) { history in
                    HistoryRowView(history: history)
                    Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity, minHeight: 1, maxHeight: 1)
                    .background(Color.gray100)
                }
            }
        }
        .padding(16)
        .frame(width: 335, alignment: .topLeading)
        .background(.white)
        .cornerRadius(20)
    }
}

fileprivate struct HistoryRowView: View {
    let history: HistoryListModel
    
    fileprivate var body: some View {
        HStack {
            Text(history.title)
                .font(.pretendardFont(.regular, size: 16))
            Spacer()
            Image(.TodayMission.iconPoint)
            Text("\(history.pointNum)")
                .font(.pretendardFont(.semiBold, size: 14))
                .foregroundStyle(Color.green200)
        }
        .background(.white)
    }
}


