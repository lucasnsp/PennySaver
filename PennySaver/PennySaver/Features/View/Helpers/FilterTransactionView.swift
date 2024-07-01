//
//  FilterTransactionView.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 30/06/24.
//

import SwiftUI
import SwiftData

struct FilterTransactionView<Content: View>: View {
    var content: ([Transaction]) -> Content
    @Query(animation: .snappy) private var transactions: [Transaction]

    // Category Filter
    init(category: Category?, searchText: String, @ViewBuilder content: @escaping ([Transaction]) -> Content) {
        let rawValue = category?.rawValue ?? ""
        let predicate = #Predicate<Transaction> { transaction in
            return (transaction.title.localizedStandardContains(searchText) ||
                    transaction.remarks.localizedStandardContains(searchText)) && 
            (rawValue.isEmpty ? true : transaction.category == rawValue)
        }

        _transactions = Query(filter: predicate, sort: [
            SortDescriptor(\Transaction.dateAdded, order: .reverse)
        ], animation: .snappy)

        self.content = content
    }

    // Date Filter
    init(startDate: Date, endDate: Date, @ViewBuilder content: @escaping ([Transaction]) -> Content) {
        let predicate = #Predicate<Transaction> { transaction in
            return transaction.dateAdded >= startDate && transaction.dateAdded <= endDate
        }

        _transactions = Query(filter: predicate, sort: [
            SortDescriptor(\Transaction.dateAdded, order: .reverse)
        ], animation: .snappy)

        self.content = content
    }

    init(startDate: Date, endDate: Date, category: Category?, @ViewBuilder content: @escaping ([Transaction]) -> Content) {
        let rawValue = category?.rawValue ?? ""
        let predicate = #Predicate<Transaction> { transaction in
            return transaction.dateAdded >= startDate && transaction.dateAdded <= endDate && (rawValue.isEmpty ? true : transaction.category == rawValue)
        }

        _transactions = Query(filter: predicate, sort: [
            SortDescriptor(\Transaction.dateAdded, order: .reverse)
        ], animation: .snappy)

        self.content = content
    }

    var body: some View {
        content(transactions)
    }
}

