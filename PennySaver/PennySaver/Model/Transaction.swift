//
//  Transaction.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 24/06/24.
//

import SwiftUI

struct Transaction: Identifiable {
    let id: UUID = .init()
    /// Properties
    var title: String
    var remarks: String
    var amount: Double
    var dateAdded: Date
    var category: String
    var tintColor: String

    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }

    // Extracting Color Value from TintColor String
    var color: Color {
        return tints.first(where: { $0.color == tintColor})?.value ?? appTint
    }
}
