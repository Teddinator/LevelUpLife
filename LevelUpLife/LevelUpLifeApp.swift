//
//  LevelUpLifeApp.swift
//  LevelUpLife
//
//  Created by Theodor Nilsson on 2026-05-13.
//

import SwiftUI


@main
struct LevelUpLifeApp: App {
    @State private var playerStore = PlayerStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(playerStore)
    }
}
