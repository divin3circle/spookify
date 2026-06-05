//
//  SpookifyApp.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import SwiftUI
import SwiftfulRouting

@main
struct SpookifyApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}
