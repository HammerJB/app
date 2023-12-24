//
//  SettingsView.swift
//  HammerJB
//
//  Created by Skadz on 12/23/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var playMusic = false
    @State private var enableTweaks = false
    var kernelExploits = ["KFD", "MDC"]
    @State private var selectedKernelExploit = "KFD"
    var puafPages = ["16", "32", "64", "128", "256", "512", "1024", "2048"]
    @State private var selectedPuafPages = "2048"
    var puafMethods = ["physpuppet", "smith"]
    @State private var selectedPuafMethod = "smith"
    var kreadMethods = ["kqueue_workloop_ctl", "sem_open"]
    @State private var selectedKreadMethod = "sem_open"
    var kwriteMethods = ["dup", "sem_open"]
    @State private var selectedKwriteMethod = "sem_open"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            List {
                Section(header: Text("Jailbreak Options"), content: {
                    Toggle("Play music", isOn: $playMusic)
                    Toggle("Enable tweaks", isOn: $enableTweaks)
                })
                Section(header: Text("Exploit Options"), content: {
                    Picker("Kernel Exploit", selection: $selectedKernelExploit) {
                        ForEach(kernelExploits, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    if selectedKernelExploit == "KFD" {
                        Picker("puaf pages", selection: $selectedPuafPages) {
                            ForEach(puafPages, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("puaf method", selection: $selectedPuafMethod) {
                            ForEach(puafMethods, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("kread method", selection: $selectedKreadMethod) {
                            ForEach(kreadMethods, id: \.self) {
                                Text($0)
                            }
                        }
                        Picker("kwrite method", selection: $selectedKwriteMethod) {
                            ForEach(kwriteMethods, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                })
                Section(header: Text("Credits"), content: {
                    CreditRow(name: "Skadz", role: "Owner, App Developer", link: URL(string: "http://discord.com/users/663877587692552222")).foregroundStyle(.red)
                    CreditRow(name: "Lrdsnow", role: "Placeholder Role", link: URL(string: "https://github.com/Lrdsnow")).foregroundStyle(.purple)
                    CreditRow(name: "BrocoDev", role: "Placeholder Role", link: URL(string: "https://github.com/Broco8Dev")).foregroundStyle(.orange)
                    CreditRow(name: "iwishkem", role: "Placeholder Role", link: URL(string: "https://github.com/iwishkem")).foregroundStyle(.pink)
                    CreditRow(name: "Gh0st", role: "Placeholder Role", link: URL(string: "https://discord.com/users/1171532630802563123")).foregroundStyle(.white)
                    CreditRow(name: "lunginspector", role: "Placeholder Role", link: URL(string: "https://discord.com/users/1099903964801151030")).foregroundStyle(.cyan)
                })
            }
        }
    }
}

struct CreditRow: View {
    let name: String
    let role: String
    let link: URL?
    var body: some View {
        Link(destination: link ?? URL(string: "file:///")!) {
            HStack {
                Image(name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text(name).font(.body.bold()).lineLimit(1)
                Spacer()
                Text(role).opacity(0.7).lineLimit(1)
            }
        }
    }
}
