//
//  Tab.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI

enum Tab: String {
    case recents = "Recentes"
    case search = "Busca"
    case charts = "Dados"
    case learn = "Aprenda"
    case settings = "Configurações"

    @ViewBuilder
    var tabContent: some View {
        switch self {
        case .recents:
            Image(systemName: "calendar")
            Text(self.rawValue)
        case .search:
            Image(systemName: "magnifyingglass")
            Text(self.rawValue)
        case .charts:
            Image(systemName: "chart.bar.xaxis")
            Text(self.rawValue)
        case .learn:
            Image(systemName: "graduationcap")
            Text(self.rawValue)
        case .settings:
            Image(systemName: "gearshape")
            Text(self.rawValue)
        }
    }
}
