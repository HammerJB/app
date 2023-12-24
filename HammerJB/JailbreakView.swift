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
    @State var logText: String = "Jailbreak not started"
    
    func jailbreak() {
        playSound()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            logText = "Installing virus..."
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            logText = "Extracting passwords..."
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.5) {
            logText = "Deleting /var..."
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.5) {
            logText = ":troll:"
        }
    }
    
    var body: some View {
        VStack {
            Text("HammerJB")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(logText)
                .font(.system(.body, design: .monospaced))
                .padding()
                .foregroundColor(.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.pink, lineWidth: 5)
                )
            Button(action: {
                logText = "Exploiting..."
                jailbreak()
            }) {
                Text("Jailbreak")
            }.buttonStyle(.bordered).tint(.red).padding()
        }
    }
}
