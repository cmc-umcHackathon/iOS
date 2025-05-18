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
        .init(date: "2025.05.18", histories:[
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18)
        ]),
        .init(date: "2025.05.18", histories:[
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18)
        ]),
        .init(date: "2025.05.18", histories:[
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18)
        ]),
        .init(date: "2025.05.18", histories:[
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18),
            .init(title: "텀블러 1회 사용하기", pointNum: 18)
        ]),
    ]
}


class HistoryViewModel: ObservableObject {
    @Published var histories: [HistoryModel] = []
    
    private let router: NavigationRouter
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: HistoryProtocol
    
    init(router: NavigationRouter, dataManager: HistoryProtocol = History.shared) {
        self.router = router
        self.dataManager = dataManager
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
