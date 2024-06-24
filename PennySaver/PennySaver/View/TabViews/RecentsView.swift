//
//  Recents.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI

struct RecentsView: View {
    var body: some View {
        GeometryReader {
            let size = $0.size

            NavigationStack {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section {

                        } header: {
                            HeaderView(size)
                        }
                    }
                    .padding(15)
                }
            }
        }
    }

    // Header View
    @ViewBuilder
    func HeaderView(_ size: CGSize) -> some View {
        VStack(alignment: .leading, spacing: 5, content: {
            Text("Bem vindo!")
                .font(.title.bold())
        })
        .hSpacing(.leading)
        .background {
            Rectangle()
                .fill(.ultraThinMaterial)
                .padding(.horizontal, -15)
                .padding(.top, -(safeArea.top + 15))
        }
    }
}

#Preview {
    TabsView()
}
