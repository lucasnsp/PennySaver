//
//  PennySaverApp.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI
import SwiftData
import WidgetKit

@main
struct PennySaverApp: App {
    @StateObject private var manager = DataManager()
    var body: some Scene {
        WindowGroup {
            TabsView()
                .environmentObject(manager)
                .onAppear {
                    WidgetCenter.shared.reloadAllTimelines()
                }
        }
        .modelContainer(for: [Transaction.self])
    }
}
