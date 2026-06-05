//
//  ContentView.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                    .tabItem {
                        Label(
                            "Home",
                            systemImage: "house"
                        )
                    }
            Text(
                "Users"
            )
            .tabItem {
                Label(
                    "Users",
                    systemImage: "person"
                )
            }
            Text(
                "Explore"
            )
            .tabItem {
                Label(
                    "Explore",
                    systemImage: "globe"
                )
            }
            Text(
                "Settings"
            )
            .tabItem {
                Label(
                    "Settings",
                    systemImage: "gear"
                )
                }
        }
    }
}

#Preview {
    ContentView()
}
