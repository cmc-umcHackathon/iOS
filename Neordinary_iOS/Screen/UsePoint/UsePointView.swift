//
//  UsePointView.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/18/25.
//

import SwiftUI

struct UsePointView: View {
    @ObservedObject var usePointViewModel: UsePointViewModel
    
    var body: some View {
        ZStack {
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
            
            if usePointViewModel.isShowPopup {
                PurchaceItemCheckingView(usePointViewModel: usePointViewModel)
            }
        }
        .task {
            await usePointViewModel.fetchUserAllPoint()
        }
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

fileprivate struct PurchasableItemListView: View {
    @ObservedObject var usePointViewModel: UsePointViewModel
    
    fileprivate var body: some View {
        ScrollView {
            ForEach(
                usePointViewModel.usePointModel.purchasableItemList,
                id: \.id
            ) { item in
                Button {
                    usePointViewModel.purchaseItem(item)
                    Task {
                        await usePointViewModel.fetchProductList()
                    }
                } label: {
                    PurchasableItemView(item: item)
                }

            }
        }
    }
}

fileprivate struct PurchasableItemView: View {
    let item: PurchasableItem
    
    fileprivate var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .frame(width: 72, height: 72)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer().frame(width: 24)
            
            VStack(alignment: .leading, spacing: 26) {
                Text(item.title)
                    .font(.pretendardFont(.semiBold, size: 16))
                    .foregroundStyle(Color.gray600)
                
                Text("\(item.point)P")
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

fileprivate struct PurchaceItemCheckingView: View {
    @ObservedObject var usePointViewModel: UsePointViewModel
    
    fileprivate var body: some View {
        ZStack {
            Color.black
                .opacity(0.7)
                .ignoresSafeArea()
                .onTapGesture {
                    usePointViewModel.isShowPopup = false
                    usePointViewModel.selectedItem = nil
                }
            
            Image(.UsePoint.checkingCardBg)
                .resizable()
                .frame(width: 304, height: 224)
            
            VStack(spacing: 24) {
                
                Text("구매 완료")
                    .font(.pretendardFont(.semiBold, size: 16))
                    .foregroundStyle(Color.white000)
                
                if let title = usePointViewModel.selectedItem?.title {
                    Text("\"\(title)\"")
                        .font(.pretendardFont(.semiBold, size: 24))
                        .foregroundStyle(Color.white000)
                }
                
                if let point = usePointViewModel.selectedItem?.point {
                    Text("\(point)P 사용")
                        .font(.pretendardFont(.semiBold, size: 24))
                        .foregroundStyle(Color.white000)
                }
            }
            .padding(.vertical, 48)
            .padding(.horizontal, 20)

        }
    }
}

#Preview {
    UsePointView(usePointViewModel: .init(router: NavigationRouter()))
}
