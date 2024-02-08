//
//  MaccabiTestApp.swift
//  MaccabiTest
//
//  Created by aaaaa on 08/02/2024.
//

import SwiftUI

@main
struct MaccabiTestApp: App {
    @StateObject var vm = HomeViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
