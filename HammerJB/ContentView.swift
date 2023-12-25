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
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
            TabView {
                JailbreakView(settingsData: settingsData)
                    .tabItem {
                        Label("Jailbreak", systemImage: "lock.open.fill")
                    }.background(Color.black)
                SettingsView(settingsData: settingsData)
                    .tabItem {
                        Label("Settings",
                              systemImage: "gear")
                    }.background(Color.black)
            }.overlay(TabBarDivider(), alignment: .top).background(Color.black).edgesIgnoringSafeArea(.all).navigationBarHidden(true).safeAreaInset(edge: .top)
    }
}

struct TabBarDivider: View {
    var body: some View {
        Divider()
            .background(Color.gray)
    }
}
