//
//  HammerJBApp.swift
//  HammerJB
//
//  Created by Skadz on 12/23/23.

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            JailbreakView()
                .tabItem {
                    Label("Jailbreak", systemImage: "lock.open.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings",
                systemImage: "gear")
                }
        }
    }
}

