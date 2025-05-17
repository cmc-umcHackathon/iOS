//
//  CategoryView.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var categoryViewModel: CategoryViewModel = .init()
    
    var body: some View {
        VStack {
            HeaderBar(categoryViewModel: categoryViewModel)
            
            Spacer().frame(height: 24)
            
            ActivityCardView(categoryViewModel: categoryViewModel)
            
            Spacer().frame(height: 30)
            
            ActivityListView(categoryViewModel: categoryViewModel)
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
                Image(.Category.homeIcon)
            }
            
            Spacer()
            
            Text("카테고리명")
                .font(.pretendardFont(.semiBold, size: 18))
                .foregroundStyle(Color.black000)
            
            Spacer()
            
            Button {
                print("My")
            } label: {
                Image(.Category.myIcon)
            }
        }
        .padding(.horizontal, 20)
    }
}

fileprivate struct ActivityCardView: View {
    @ObservedObject var categoryViewModel: CategoryViewModel
    
    fileprivate var body: some View {
        VStack {
            Spacer().frame(height: 20)
            
            header
            
            Text(categoryViewModel.selectedActivity?.title ?? "활동명")
                .font(.pretendardFont(.semiBold, size: 20))
            
            Spacer().frame(height: 12)
            
            Text(categoryViewModel.selectedActivity?.description ?? "활동 설명")
                .font(.pretendardFont(.regular, size: 14))
            
            Spacer().frame(height: 24)
            
            Image(.Category.circleIcon)
            
            Spacer().frame(height: 24)
            
            Text(categoryViewModel.selectedActivity?.impactMessage ?? "장려메세지")
                .font(.pretendardFont(.regular, size: 16))
                .foregroundStyle(Color.gray500)
            
            Spacer().frame(height: 24)
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    categoryViewModel.selectedActivity?.isSuccess.backgroundColor ?? Color.white000
                )
        )
        .padding(.horizontal, 35)
    }
    
    private var header: some View {
        return HStack {
            switch categoryViewModel.headerButtonState {
            case .defaultValue:
                failBtn
                Spacer()
                okBtn
            case .success:
                Spacer()
                okBtn
            case .fail:
                failBtn
                Spacer()
            }
        }
        .padding(.horizontal, 20)
    }
    
    private var okBtn: some View {
        Button {
            withAnimation {
                categoryViewModel.updateActivityState(.success)
            }
        } label: {
            Image(.Category.okIcon)
        }
    }
    
    private var failBtn: some View {
        Button {
            withAnimation {
                categoryViewModel.updateActivityState(.fail)
            }
        } label: {
            Image(.Category.cancelIcon)
        }
    }
}

fileprivate struct ActivityListView: View {
    @ObservedObject var categoryViewModel: CategoryViewModel
    
    fileprivate var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(
                    categoryViewModel.categoryModel.categories,
                    id: \.id
                ) { category in
                    ActivityRowView(
                        categoryListModel: category,
                        categoryViewModel: categoryViewModel
                    )
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

fileprivate struct ActivityRowView: View {
    let categoryListModel: CategoryListModel
    @ObservedObject var categoryViewModel: CategoryViewModel
    
    fileprivate var body: some View {
        Button {
            withAnimation(.easeIn(duration: 0.1)) {
                categoryViewModel.selectedActivity = categoryListModel
            }
        } label: {
            HStack {
                Image(
                    categoryListModel.isSuccess == .success
                    ? .Category.leafIcon
                    : .Category.unselectLeafIcon
                )
                
                Text(categoryListModel.title)
                    .font(.pretendardFont(.regular, size: 16))
                    .foregroundStyle(.black)
                
                Spacer()
                
                porintView
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white000)
        )
    }
    
    private var porintView: some View {
        HStack {
            Image(.Category.pointIcon)
            
            Text("\(categoryListModel.pointNum)")
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

#Preview {
    CategoryView()
}
