//
//  HistoryViewModel.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import Foundation

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
    
}
