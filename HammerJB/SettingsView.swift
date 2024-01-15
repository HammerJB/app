//
//  SettingsView.swift
//  HammerJB
//
//  Created by Skadz on 12/23/23.
//

import SwiftUI

class SettingsData: ObservableObject {
    @Published var playMusic = false
    @Published var enableTweaks = false
    var kernelExploits = ["KFD + CT", "MDC (Coming Soon)"]
    @Published var selectedKernelExploit = "KFD + CT"
    var puafPages = ["16", "32", "64", "128", "256", "512", "1024", "2048"]
    @Published var selectedPuafPages = "2048"
    var puafMethods = ["physpuppet", "smith", "landa"]
    @Published var selectedPuafMethod = "landa"
    var kreadMethods = ["kqueue_workloop_ctl", "sem_open"]
    @Published var selectedKreadMethod = "sem_open"
    var kwriteMethods = ["dup", "sem_open"]
    @Published var selectedKwriteMethod = "sem_open"
}

struct SettingsView: View {
    @ObservedObject var settingsData: SettingsData
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            List {
                Section(header: Text("Jailbreak Options"), content: {
                    Toggle("Play music", isOn: $settingsData.playMusic)
                    Toggle("Enable tweaks", isOn: $settingsData.enableTweaks)
                })
                Section(header: Text("Exploit Options"), content: {
                    Picker("Kernel Exploit", selection: $settingsData.selectedKernelExploit) {
                        ForEach(settingsData.kernelExploits, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("puaf pages", selection: $settingsData.selectedPuafPages) {
                        ForEach(settingsData.puafPages, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("puaf method", selection: $settingsData.selectedPuafMethod) {
                        ForEach(settingsData.puafMethods, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("kread method", selection: $settingsData.selectedKreadMethod) {
                        ForEach(settingsData.kreadMethods, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("kwrite method", selection: $settingsData.selectedKwriteMethod) {
                        ForEach(settingsData.kwriteMethods, id: \.self) {
                            Text($0)
                        }
                    }
                })
                Section(header: Text("Credits"), content: {
                    CreditRow(name: "Skadz", role: "Owner, App Developer", link: URL(string: "https://discord.com/users/663877587692552222")).foregroundStyle(.red)
                    CreditRow(name: "BrocoDev", role: "Developer, Graphic Designer", link: URL(string: "https://discord.com/users/723310347724783687")).foregroundStyle(.green)
                    CreditRow(name: "notAperson535", role: "App Developer", link: URL(string: "https://discord.com/users/902556307901546516")).foregroundStyle(.pink)
                    CreditRow(name: "Lrdsnow", role: "Placeholder Role", link: URL(string: "https://github.com/Lrdsnow")).foregroundStyle(.purple)
                    CreditRow(name: "Gh0st", role: "Placeholder Role", link: URL(string: "https://discord.com/users/1171532630802563123")).foregroundStyle(.white)
                    CreditRow(name: "lunginspector", role: "Placeholder Role", link: URL(string: "https://discord.com/users/1099903964801151030")).foregroundStyle(.cyan)
                })
            }.onChange(of: settingsData.selectedKernelExploit) { _ in
                showAlert = (settingsData.selectedKernelExploit == "MDC (Coming Soon)")
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Coming Soon"),
                    message: Text("MDC support is coming soon. For now, you can try KFD, but be aware that it may affect stability."),
                    dismissButton: .default(Text("OK")) {
                        self.settingsData.selectedKernelExploit = "KFD + CT"
                    }
                )
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
}
