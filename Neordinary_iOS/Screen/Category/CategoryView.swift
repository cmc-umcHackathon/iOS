//
//  CategoryView.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import SwiftUI
import PhotosUI

struct CategoryView: View {
    @ObservedObject var categoryViewModel: CategoryViewModel
    @State private var showPhotosPicker = false
    
    var body: some View {
        VStack {
            HeaderBar(categoryViewModel: categoryViewModel)
            
            Spacer().frame(height: 24)
            
            ActivityCardView(
                showPhotosPicker: $showPhotosPicker,
                categoryViewModel: categoryViewModel
            )
            
            Spacer().frame(height: 30)
            
            ActivityListView(categoryViewModel: categoryViewModel)
        }
        .background(
            Image(.Category.bgImg)
                .resizable()
                .ignoresSafeArea()
        )
        .photosPicker(
            isPresented: $showPhotosPicker,
            selection: $categoryViewModel.imagePickerManager.selectedItems,
            maxSelectionCount: 1,
            matching: .images
        )
        .onChange(of: categoryViewModel.imagePickerManager.selectedItems) { oldItems, newItems in
            Task {
                await categoryViewModel.imagePickerManager.convertItemsToImages()
            }
        }
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
    @Binding var showPhotosPicker: Bool
    @ObservedObject var categoryViewModel: CategoryViewModel
    
    fileprivate var body: some View {
        if categoryViewModel.selectedActivity != nil {
            activityView
        } else {
            finishActivityView
        }
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
                categoryViewModel.updateCurrentAndMoveNext(to: .success)
                showPhotosPicker = true
            }
        } label: {
            Image(.Category.okIcon)
        }
    }
    
    private var failBtn: some View {
        Button {
            withAnimation {
                categoryViewModel.updateCurrentAndMoveNext(to: .fail)
            }
        } label: {
            Image(.Category.cancelIcon)
        }
    }
    
    private var activityView: some View {
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
        .frame(width: 304, height: 356)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    categoryViewModel.selectedActivity?.isSuccess.backgroundColor ?? Color.white000
                )
        )
        .padding(.horizontal, 35)
    }
    
    private var finishActivityView: some View {
        VStack(spacing: 16) {
            Text("오늘의 활동을 모두 마쳤어요!")
                .font(.pretendardFont(.semiBold, size: 18))
                .foregroundColor(.black)
        }
        .frame(width: 304, height: 356)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.gray200)
        )
        .padding(.horizontal, 20)
        .multilineTextAlignment(.center)
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
    CategoryView(categoryViewModel: .init())
}
