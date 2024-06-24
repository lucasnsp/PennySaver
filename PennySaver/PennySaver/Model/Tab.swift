//
//  Tab.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI

enum Tab: String {
    case recents = "Recents"
    case search = "Filter"
    case charts = "Charts"
    case settings = "Settings"

    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .recents:
            Image(systemName: "calendar")
            Text(self.rawValue)
        case .search:
            Image(systemName: "magnifyngglass")
            Text(self.rawValue)
        case .charts:
            Image(systemName: "chart.bar.xaxis")
            Text(self.rawValue)
        case .settings:
            Image(systemName: "geershape")
            Text(self.rawValue)
        }
    }
}