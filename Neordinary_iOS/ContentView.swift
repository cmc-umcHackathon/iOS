//
//  ContentView.swift
//  Ne(O)rdinary_iOS
//
//  Created by jaewon Lee on 5/17/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var router: NavigationRouter
    
    var body: some View {
        NavigationStack(path: $router.path) {
            Button {
                router.push(.login)
            } label: {
                Text("Login")
            }
        }
        .navigationDestination(for: Route.self) { route in
            switch route {
            case .login:
                LoginView()
            }
        }
    }
}

struct LoginView: View {
    var body: some View {
        Text("Login")
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationRouter())
}
