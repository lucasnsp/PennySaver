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
                    TextField("iJustine", text: $manager.userName)
                }

                Section("App lock") {
                    Toggle("Enable Lock", isOn: $manager.isAppLockEnabled)

                    if manager.isAppLockEnabled {
                        Toggle("Lock When App Goes Background", isOn: $manager.lockWhenAppGoesBackground)
                    }
                }
            }
            .navigationTitle("Configurações")
        }
    }
}

#Preview {
    TabsView()
}
