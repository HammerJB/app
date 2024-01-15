//
//  ContentView.swift
//  HammerJB
//
//  Created by Skadz on 12/23/23.

import SwiftUI

struct BackgroundColorSetter: UIViewControllerRepresentable {
    var backgroundColor: UIColor

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = backgroundColor
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        uiViewController.view.backgroundColor = backgroundColor
    }
}

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
                    }
                SettingsView(settingsData: settingsData)
                    .tabItem {
                        Label("Settings", systemImage: "gearshape.fill")
                    }
                DeveloperView(settingsData: settingsData)
                    .tabItem {
                        Label("Developer", systemImage: "exclamationmark.triangle.fill")
                    }
            }.overlay(TabBarDivider(), alignment: .top).background(BackgroundColorSetter(backgroundColor: UIColor.white)).edgesIgnoringSafeArea(.all)
    }
}

struct TabBarDivider: View {
    var body: some View {
        Divider()
            .background(Color.gray)
    }
}
