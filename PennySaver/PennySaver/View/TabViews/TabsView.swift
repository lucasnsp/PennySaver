//
//  HomeView.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI

struct TabsView: View {
    /// Intro Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    // App Lock Properties
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    /// Active Tab
    @State private var activeTab: Tab = .recents
    var body: some View {
        LockView(lockType: .biometric, lockPin: "", isEnabled: isAppLockEnabled, lockWhenAppGoesBackground: lockWhenAppGoesBackground) {
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
            .sheet(isPresented: $isFirstTime, content: {
                IntroScreen()
                    .interactiveDismissDisabled()
            })
        }
    }
}

#Preview {
    TabsView()
}
