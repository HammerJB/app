//
//  IconSelectorView.swift
//  HammerJB
//
//  Created by Skadz on 1/4/24.
//  Code stolen from PureKFD.
//

import SwiftUI
import Foundation
import UIKit

struct IconSelectorView: View {
    @State private var selectedIconName: String? = nil

    var icons = ["AppIcon", "AppIcon-Glyph"]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(icons, id: \.self) { iconName in
                            Button(action: {
                                NSLog("%@", iconName)
                                setAppIcon(iconName)
                            }) {
                                Image(uiImage: UIImage(named: iconName) ?? UIImage())
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.accentColor, lineWidth: selectedIconName == iconName ? 2 : 0)
                                    )
                                    .padding(8)
                            }
                            .onAppear {
                                if selectedIconName == nil {
                                    selectedIconName = UIApplication.shared.alternateIconName ?? "AppIcon"
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }.navigationTitle("Select an icon")
    }

    private func setAppIcon(_ iconName: String) {
        UIApplication.shared.setAlternateIconName(iconName) { error in
            if let error = error {
                NSLog("Error changing app icon: %@")
            } else {
                selectedIconName = iconName
                NSLog("App icon changed successfully to: %@", iconName)
            }
        }
    }
}
