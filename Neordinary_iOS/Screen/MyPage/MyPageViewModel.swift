//
//  MyPageViewModel.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import Foundation
import Combine

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
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: MyPageProtocol
    
    init(router: NavigationRouter,dataManager: MyPageProtocol = MyPage.shared) {
        self.router = router
        self.dataManager = dataManager
    }
    
    func moveToUsePointView() {
        router.push(.usePoint)
    }
    
    func getActivityCount() {
        dataManager.getActivityCount()
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] count in
                self?.actionCount = count
                print(count)
                if count < 20 {
                    self?.earthStatus = .worst
                } else if count < 50 {
                    self?.earthStatus = .normal
                } else {
                    self?.earthStatus = .health
                }
            }
            .store(in: &cancellableSet)
    }
    
    func getPoint() {
        dataManager.getPoint()
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] point in
                self?.point = point
                print(point)
            }
            .store(in: &cancellableSet)
    }
}

