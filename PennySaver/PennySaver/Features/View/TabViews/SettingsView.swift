//
//  Settings.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI

struct SettingsView: View {
    // User Properties
    @AppStorage("userName") private var userName: String = ""
    // App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    var body: some View {
        NavigationStack {
            List {
                Section("Usuário") {
                    TextField("iJustine", text: $userName)
                }

                Section("App lock") {
                    Toggle("Enable Lock", isOn: $isAppLockEnabled)

                    if isAppLockEnabled {
                        Toggle("Lock When App Goes Background", isOn: $lockWhenAppGoesBackground)
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
