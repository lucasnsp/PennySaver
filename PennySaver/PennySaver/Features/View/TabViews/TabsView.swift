//
//  HomeView.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI

struct TabsView: View {
    @EnvironmentObject var manager: DataManager
    @State private var activeTab: Tab = .recents
    var body: some View {
        LockView(lockType: .biometric, lockPin: "", isEnabled: manager.isAppLockEnabled, lockWhenAppGoesBackground: manager.lockWhenAppGoesBackground) {
            TabView(selection: $activeTab) {
                RecentsView()
                    .tag(Tab.recents)
                    .tabItem { Tab.recents.tabContent }

                SearchView()
                    .tag(Tab.search)
                    .tabItem { Tab.search.tabContent }

                GraphsView()
                    .tag(Tab.charts)
                    .tabItem { Tab.charts.tabContent }

                SettingsView()
                    .tag(Tab.settings)
                    .tabItem { Tab.settings.tabContent }
            }
            .tint(appTint)
        }
    }
}

#Preview {
    TabsView()
}
