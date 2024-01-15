//
//  DeveloperView.swift
//  HammerJB
//
//  Created by Skadz on 12/26/23.
//

import SwiftUI

struct DeveloperView: View {
    @StateObject var settingsData = SettingsData()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                List {
                    Section(header: Text("Warning"), content: {
                        Text("Everything in here is experimental. This is just for testing functions and UI elements without filling up the SettingsView.")
                    })
                    Section(header: Text("Testing Zone"), content: {
                        NavigationLink(destination: IconSelectorView(), label: {
                            Text("Change app icon")
                        })
                    })
                }.listStyle(.insetGrouped)
            }
        }.navigationTitle("Developer").navigationBarTitleDisplayMode(.large)
    }
}
