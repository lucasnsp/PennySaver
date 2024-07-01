//
//  PennySaverApp.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI
import SwiftData

@main
struct PennySaverApp: App {
    var body: some Scene {
        WindowGroup {
            TabsView()
        }
        .modelContainer(for: [Transaction.self])
    }
}
