//
//  TodayMissionViewModel.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import Foundation
import Combine

struct MissionModel {
    var missions: [MissionListModel]
}

struct MissionListModel: Identifiable {
    let id = UUID()
    let description: String
    var isSuccess: Bool
    let pointNum: Int
}

class TodayMissionViewModel: ObservableObject {
    private var router: NavigationRouter
    @Published var missionModel: MissionModel = MissionModel(missions: [])
    @Published var popup: Bool = false
    @Published var selectedMission: String = ""
    @Published var selectedId: Int = 0
    
    init(router: NavigationRouter,dataManager: TodayMissionProtocol = TodayMission.shared) {
        self.router = router
        self.dataManager = dataManager
    }
    
    private var cancellableSet: Set<AnyCancellable> = []
    var dataManager: TodayMissionProtocol
    
    func moveToCategory() {
        print("moveToCategory")
        router.push(.categoryDetail)
    }
    
    func moveToMyPage() {
        router.push(.myPage)
    }
    
    func getTodayMission() {
        dataManager.getTodayMission()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    // error
                    print(dataResponse.error)
                } else {
                    let response = dataResponse.value!
                    print(response)
                    var mission: [MissionListModel] = []
                    for item in response {
                        let description = item.title
                        let point = item.point
                        let success = item.todayActivity
                        mission.append(MissionListModel(description: description, isSuccess: success, pointNum: point))
                    }
                    self.missionModel.missions = mission
                }
            }.store(in: &cancellableSet)
    }
    
    func postTodayMission() {
        dataManager.postTodayMission(id: selectedId)
            .sink { [weak self] completion in
                guard let self = self else {return}
                switch completion {
                case .finished:
                    print("")
                    
                case .failure(let error):
                    print("")
                }
            } receiveValue: { [weak self] data in
                guard let self = self else {return}
                print(data)
            }
            .store(in: &cancellableSet)
    }
}
