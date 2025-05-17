//
//  ActionViewModel.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import Foundation
import Combine

struct Action {
    var title: String
    var category: String
    var description: String
    var duration: String
}

class ActionViewModel: ObservableObject {
    @Published var action: Action = .init(title: "", category: "", description: "", duration: "")
    @Published var category: [String] = ["생활 습관", "이동", "소비", "사회 활동"]
    @Published var duration: [String] = ["매일", "주1-2회", "주3회", "주4회"]
    @Published var activeStatus: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $action
            .dropFirst()
            .sink { [weak self] newAction in
                self?.checkActive()
            }
            .store(in: &cancellables)
    }
    
    func checkActive() {
        if action.category != "" && action.category != "" && action.description != "" && action.duration != "" {
            self.activeStatus = true
        } else {
            self.activeStatus = false
        }
    }
}
