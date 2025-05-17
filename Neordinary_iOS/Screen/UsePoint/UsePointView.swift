//
//  PointView.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import SwiftUI

struct PointView: View {
    @ObservedObject var usePointViewModel: UsePointViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            Group {
                PointCheckView(usePointViewModel: usePointViewModel)
                
                PurchasableItemListView(usePointViewModel: usePointViewModel)
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
    @ObservedObject var usePointViewModel: UsePointViewModel
    
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
                
                Text("\(usePointViewModel.usePointModel.myPoint)P")
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
fileprivate struct PurchasableItemListView: View {
    @ObservedObject var usePointViewModel: UsePointViewModel
    
    fileprivate var body: some View {
        ScrollView {
            ForEach(
                usePointViewModel.usePointModel.purchasableItemList,
                id: \.id
            ) { mission in
                PurchasableItemView(mission: mission)
            }
        }
    }
}

fileprivate struct PurchasableItemView: View {
    let mission: PurchasableItem
    
    fileprivate var body: some View {
        HStack {
            Image(mission.image)
                .resizable()
                .frame(width: 72, height: 72)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer().frame(width: 24)
            
            VStack(alignment: .leading, spacing: 26) {
                Text(mission.title)
                    .font(.pretendardFont(.semiBold, size: 16))
                    .foregroundStyle(Color.gray600)
                
                Text("\(mission.point)P")
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
    PointView(usePointViewModel: .init())
}
