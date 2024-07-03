//
//  Graphs.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI
import Charts
import SwiftData

struct GraphsView: View {
    // View Properties
    @Query(animation: .snappy) private var transactions: [Transaction]
    @State private var chartGroups: [ChartGroup] = []
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ChartView()
                    .padding(10)
                    .frame(height: 200)
                    .background(.background, in: .rect(cornerRadius: 10))
            }
        }
        .onAppear {
            // Creating chart group -> update data when appears.
        }
    }

    @ViewBuilder
    func ChartView() -> some View {
        Chart {
            ForEach(chartGroups) { group in
                ForEach(group.categories) { chart in
                    BarMark(
                        x: .value("Mês", format(date: group.date, format: "MM yy")),
                        y: .value(chart.category.rawValue, chart.totalValue),
                        width: 20
                    )
                    .position(by: .value("Categoria", chart.category.rawValue), axis: .horizontal)
                    .foregroundStyle(by: .value("Categoria", chart.category.rawValue))
                }
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartForegroundStyleScale(range: [Color.green.gradient, Color.red.gradient])
    }

    func createChartGroup() {
        Task.detached(priority: .high) {
            let calendar = Calendar.current

            let groupedByDate = Dictionary(grouping: transactions) { transaction in
                let components = calendar.dateComponents([.month, .year], from: transaction.dateAdded)

                return components
            }

            // Sorting groups by Date
            let sortedGroups = groupedByDate.sorted {
                let date1 = calendar.date(from: $0.key) ?? .init()
                let date2 = calendar.date(from: $1.key) ?? .init()

                return calendar.compare(date1, to: date2, toGranularity: .day) == .orderedDescending
            }
        }
    }
}

#Preview {
    GraphsView()
}
