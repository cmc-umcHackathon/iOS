//
//  PointView.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import SwiftUI

struct PointView: View {
    var body: some View {
        VStack(spacing: 24) {
            Group {
                PointCheckView()
                
                ClearMissionListView()
            }
            .padding(.horizontal, 20)
        }
        .customNavigationBar {
            BackButton()
        } centerView: {
            Text("포인트 사용")
                .font(.pretendardFont(.semiBold, size: 18))
                .foregroundStyle(.black)
        }
        .background(Color.gray100)
    }
}

fileprivate struct PointCheckView: View {
    fileprivate var body: some View {
        HStack {
            Text("나의 포인트")
                .font(.pretendardFont(.semiBold, size: 20))
                .foregroundStyle(Color.gray500)
            
            Spacer()
            
            HStack {
                Image(.pointIcon)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Text("331P")
                    .font(.pretendardFont(.semiBold, size: 20))
                    .foregroundStyle(Color.green200)
            }
        }
        .frame(width: 335, height: 56)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white000)
        )
    }
}

// MARK: 완료한 미션 리스트 보여주는 뷰
fileprivate struct ClearMissionListView: View {
    fileprivate var body: some View {
        ScrollView {
            ClearMissionRowView()
        }
    }
}

fileprivate struct ClearMissionRowView: View {
    fileprivate var body: some View {
        HStack {
            Image(.PointList.img1)
                .resizable()
                .frame(width: 72, height: 72)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer().frame(width: 24)
            
            VStack(alignment: .leading, spacing: 26) {
                Text("오가닉 코튼 자수 손수건")
                    .font(.pretendardFont(.semiBold, size: 16))
                    .foregroundStyle(Color.gray600)
                
                Text("260P")
                    .font(.pretendardFont(.semiBold, size: 20))
                    .foregroundStyle(Color.green200)
            }
            
            Spacer()
        }
        .frame(height: 112)
        .padding(.leading, 20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white000)
        )
    }
}

#Preview {
    PointView()
}
