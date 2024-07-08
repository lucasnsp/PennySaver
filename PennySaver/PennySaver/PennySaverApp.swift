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
    var body: some Scene {
        WindowGroup {
            TabsView()
                .onAppear {
                    WidgetCenter.shared.reloadAllTimelines()
                }
        }
        .modelContainer(for: [Transaction.self])
    }
}
