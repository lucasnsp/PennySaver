//
//  Settings.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var manager: DataManager
    var body: some View {
        NavigationStack {
            List {
                Section("Usuário") {
                    TextField("Usuário", text: $manager.userName)
                }

                Section("App lock") {
                    Toggle("Enable Lock", isOn: $manager.isAppLockEnabled)
                        .tint(appTint)

                    if manager.isAppLockEnabled {
                        Toggle("Lock When App Goes Background", isOn: $manager.lockWhenAppGoesBackground)
                            .tint(appTint)
                    }
                }
                Section("Cor do app") {
                    Toggle("DarkMode", isOn: $manager.isDarkMode)
                        .tint(appTint)
                }
            }
            .navigationTitle("Configurações")
        }
    }
}

#Preview {
    SettingsView()
}
