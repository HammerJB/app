//
//  JailbreakView.swift
//  HammerJB
//
//  Created by Skadz on 12/23/23.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer?

func playSound() {
    guard let path = Bundle.main.path(forResource: "infectious_ncs", ofType:"mp3") else {
        return }
    let url = URL(fileURLWithPath: path)
    
    do {
        player = try AVAudioPlayer(contentsOf: url)
        player?.play()
        
    } catch let error {
        print(error.localizedDescription)
    }
}

struct JailbreakView: View {
    @State var logText: String = "****************\nHammerJB\n****************\n\nMade by the HammerJB Team\n\nHammerJB is free software.\nIf you paid for this tool, demand a refund immediately."
    @StateObject var settingsData = SettingsData()
    @State private var buttonEnabled = true
    
    func jailbreak() {
        if settingsData.playMusic == true {
            playSound()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            logText = "****************\nHammerJB\n****************\n\nMade by the HammerJB Team\n\nHammerJB is free software.\nIf you paid for this tool, demand a refund immediately.\n\n[*] Exploiting with \(settingsData.selectedKernelExploit)...\n[*] Installing virus..."
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            logText = "****************\nHammerJB\n****************\n\nMade by the HammerJB Team\n\nHammerJB is free software.\nIf you paid for this tool, demand a refund immediately.\n\n[*] Exploiting with \(settingsData.selectedKernelExploit)...\n[*] Installing virus...\n[*] Extracting passwords..."
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) {
            logText = "****************\nHammerJB\n****************\n\nMade by the HammerJB Team\n\nHammerJB is free software.\nIf you paid for this tool, demand a refund immediately.\n\n[*] Exploiting with \(settingsData.selectedKernelExploit)...\n[*] Installing virus...\n[*] Extracting passwords...\n[*] Deleting /var..."
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.5) {
            logText = "****************\nHammerJB\n****************\n\nMade by the HammerJB Team\n\nHammerJB is free software.\nIf you paid for this tool, demand a refund immediately.\n\n[*] Exploiting with \(settingsData.selectedKernelExploit)...\n[*] Installing virus...\n[*] Extracting passwords...\n[*] Deleting /var...\nJailbreak successful! Reboot to finish."
        }
    }
    
    var body: some View {
        VStack {
            Text("HammerJB")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(logText)
                .font(.system(size: 14, design: .monospaced))
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.pink, lineWidth: 5)
                )
            Button(action: {
                logText = "****************\nHammerJB\n****************\n\nMade by the HammerJB Team\n\nHammerJB is free software.\nIf you paid for this tool, demand a refund immediately.\n\n[*] Exploiting with \(settingsData.selectedKernelExploit)..."
                jailbreak()
                buttonEnabled = false
                
            }) {
                Text("Jailbreak")
            }.buttonStyle(.bordered).tint(.red).padding().disabled(!buttonEnabled)
            Text("Please ensure your exploit settings are correct before jailbreaking")
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.red)
        }
    }
}


