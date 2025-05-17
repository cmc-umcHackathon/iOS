//
//  CategoryView.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack {
            HeaderBar()
            
            Spacer().frame(height: 24)
            
            ActivityCardView()
            
            Spacer().frame(height: 30)
            
            ActivityListView()
        }
        .background(Color.gray100)
    }
}

fileprivate struct HeaderBar: View {
    fileprivate var body: some View {
        HStack {
            Image(.Category.homeIcon)
            
            Spacer()
            
            Text("카테고리명")
                .font(.pretendardFont(.semiBold, size: 18))
                .foregroundStyle(Color.black000)
            
            Spacer()
            
            Image(.Category.myIcon)
        }
        .padding(.horizontal, 20)
    }
}

fileprivate struct ActivityCardView: View {
    fileprivate var body: some View {
        VStack {
            Spacer().frame(height: 20)
            
            header
            
            Text("활동명")
                .font(.pretendardFont(.semiBold, size: 20))
            
            Spacer().frame(height: 12)
            
            Text("활동 설명을 적습니다.")
                .font(.pretendardFont(.regular, size: 14))
            
            Spacer().frame(height: 24)
            
            Image(.Category.circleIcon)
            
            Spacer().frame(height: 24)
            
            Text("활동시감소멘트")
                .font(.pretendardFont(.regular, size: 16))
                .foregroundStyle(Color.gray500)
            
            Spacer().frame(height: 24)
        }
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white000)
        )
        .padding(.horizontal, 35)
    }
    
    private var header: some View {
        return HStack {
            Image(.Category.cancelIcon)
            
            Spacer()
            
            Image(.Category.okIcon)
        }
        .padding(.horizontal, 20)
    }
}

fileprivate struct ActivityListView: View {
    fileprivate var body: some View {
        ScrollView {
            LazyVStack {
                ActivityRowView()
            }
            .padding(.horizontal, 20)
        }
    }
}

fileprivate struct ActivityRowView: View {
    fileprivate var body: some View {
        HStack {
            Image(.Category.leafIcon)
            
            Text("활동명")
                .font(.pretendardFont(.regular, size: 16))
            
            Spacer()
            
            porintView
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
            
            Text("11")
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
