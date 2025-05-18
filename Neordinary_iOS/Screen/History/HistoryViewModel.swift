//
//  HistoryViewModel.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import Foundation
import Combine

struct HistoryModel: Identifiable {
    let id = UUID()
    let date: String
    let histories: [HistoryListModel]
}

struct HistoryListModel: Identifiable {
    let id = UUID()
    let title: String
    let pointNum: Int
}

extension HistoryModel {
    static let sampleData: [HistoryModel] = [
        .init(date: "2025.05.20", histories:[
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "쓰레기 철저히 분리수거하기", pointNum: 11),
            .init(title: "음식물 쓰레기 줄이기", pointNum: 12),
            .init(title: "적정 실내 온도 유지", pointNum: 8)
        ]),
        .init(date: "2025.05.19", histories:[
            .init(title: "사용하지 않은 플러그 뽑기", pointNum: 6),
            .init(title: "키친타월 사용하지 않기", pointNum: 4),
            .init(title: "마트 이동 시 장바구니 챙기기", pointNum: 8),
            .init(title: "먼 거리 자전거 타기", pointNum: 11)
        ]),
        .init(date: "2025.03.31", histories:[
            .init(title: "식물 키우기", pointNum: 18),
            .init(title: "에코백 사용하기", pointNum: 12),
            .init(title: "환경캠페인 참여하기", pointNum: 24),
        ]),
    ]
}


class HistoryViewModel: ObservableObject {
    @Published var histories: [HistoryModel] = [
        .init(date: "2025.05.20", histories:[
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "쓰레기 철저히 분리수거하기", pointNum: 11),
            .init(title: "음식물 쓰레기 줄이기", pointNum: 12),
            .init(title: "적정 실내 온도 유지", pointNum: 8)
        ]),
        .init(date: "2025.05.19", histories:[
            .init(title: "사용하지 않은 플러그 뽑기", pointNum: 6),
            .init(title: "키친타월 사용하지 않기", pointNum: 4),
            .init(title: "마트 이동 시 장바구니 챙기기", pointNum: 8),
            .init(title: "먼 거리 자전거 타기", pointNum: 11)
        ]),
        .init(date: "2025.03.31", histories:[
            .init(title: "식물 키우기", pointNum: 18),
            .init(title: "에코백 사용하기", pointNum: 12),
            .init(title: "환경캠페인 참여하기", pointNum: 24),
        ]),
    ]
    
    private let router: NavigationRouter
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: HistoryProtocol
    
    init(router: NavigationRouter, dataManager: HistoryProtocol = History.shared) {
        self.router = router
        self.dataManager = dataManager
    }
    
    func moveToAddView() {
        router.push(.add)
    }
    
    
    func getHistory() {
        dataManager.getHistory()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    // error
                } else {
                    let response = dataResponse.value!
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy.MM.dd"
                    
                    let grouped = Dictionary(grouping: response) { response in
                        dateFormatter.string(from: response.regDt)
                    }
                    
                    var models = grouped.map { (date, items) in
                        let histories = items.map {
                            HistoryListModel(title: $0.description, pointNum: $0.point)

                        }
                        return HistoryModel(date: date, histories: histories)
                    }
                    
                    // 날짜 최신순 정렬
                    self.histories = models.sorted { $0.date > $1.date }
                }
            }.store(in: &cancellableSet)
    }
}
