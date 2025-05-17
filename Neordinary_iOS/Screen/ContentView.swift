//
//  ContentView.swift
//  Neordinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var router: NavigationRouter
    
    var body: some View {
        NavigationStack(path: $router.path) {
            TodayMissionView(todayMissionViewModel: .init(router: router))
        }
        .navigationDestination(for: Route.self) { route in
            switch route {
            case .categoryDetail:
                CategoryView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationRouter())
}
