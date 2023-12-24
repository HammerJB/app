//
//  ContentView.swift
//  HammerJB
//
//  Created by Skadz on 12/23/23.

import SwiftUI

struct ContentView: View {
    @ObservedObject var settingsData: SettingsData
    
    init(settingsData: SettingsData) {
        self.settingsData = settingsData
    }
    
    var body: some View {
        TabView {
            JailbreakView(settingsData: settingsData)
                .tabItem {
                    Label("Jailbreak", systemImage: "lock.open.fill")
                }
            SettingsView(settingsData: settingsData)
                .tabItem {
                    Label("Settings",
                          systemImage: "gear")
                }
        }.overlay(TabBarDivider(), alignment: .top)
    }
}

struct TabBarDivider: View {
    var body: some View {
        Divider()
            .background(Color.gray)
    }
}
