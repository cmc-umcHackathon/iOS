//
//  TodayMissionViewModel.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import Foundation

class TodayMissionViewModel: ObservableObject {
    @Published var missionModel: CategoryModel = .sampleData2
    @Published var popup: Bool = false
    @Published var selectedMission: String = ""
    
}
