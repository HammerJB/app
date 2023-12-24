//
//  HammerJBApp.swift
//  HammerJB
//
//  Created by Skadz on 12/23/23.
//

import SwiftUI

@main
struct HammerJBApp: App {
    @ObservedObject var settingsData = SettingsData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(settingsData: settingsData)
        }
    }
}
