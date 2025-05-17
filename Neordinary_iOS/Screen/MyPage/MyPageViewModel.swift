//
//  MyPageViewModel.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import Foundation

enum EarthStatus: String {
    case health
    case normal
    case worst
}

class MyPageViewModel: ObservableObject {
    @Published var actionCount = 0
    @Published var point = 50
    @Published var earthStatus: EarthStatus = .health
    
    private let router: NavigationRouter
    
    init(router: NavigationRouter) {
        self.router = router
    }
    
    func moveToUsePointView() {
        router.push(.usePoint)
    }
}

