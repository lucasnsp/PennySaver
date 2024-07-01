//
//  NewExpenseView.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 27/06/24.
//

import SwiftUI

struct NewExpenseView: View {
    // Env Properties
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var editTransaction: Transaction? 
    // View Properties
    @State private var title: String = ""
    @State private var remarks: String = ""
    @State private var amount: Double = .zero
    @State private var dateAdded: Date = .now
    @State private var category: Category = .expense
    // Random Tint
    @State var tint: TintColor = tints.randomElement()!
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                Text("Preview")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .hSpacing(.leading)

                // Preview Transaction Card View
                TransactionCardView(transaction: .init(
                    title: title.isEmpty ? "Titulo" : title,
                    remarks: remarks.isEmpty ? "Notas" : remarks,
                    amount: amount, dateAdded: dateAdded,
                    category: category, tintColor: tint
                ))

                CustomSection("Titulo", "Magic Keyboard", value: $title)

                CustomSection("Notas","Apple Product!", value: $remarks)

                // Amount & Category Box
                VStack(alignment: .leading, spacing: 15, content: {
                    Text("Valor & categoria")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)

                    HStack(spacing: 15) {
                        TextField("0.0", value: $amount, formatter: numberFormatter)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 12)
                            .background(.background, in: .rect(cornerRadius: 10))
                            .frame(maxWidth: 130)
                            .keyboardType(.decimalPad)

                        // Custom Check Box
                        CategoryCheckBox()
                    }
                })

                // Date Picker
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .hSpacing(.leading)

                    DatePicker("", selection: $dateAdded, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 12)
                        .background(.background, in: .rect(cornerRadius: 10))
                })
            }
            .padding(15)
        }
        .navigationTitle("Add Transação")
        .background(.gray.opacity(0.15))
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Salvar", action: save)
            }
        })
        .onAppear(perform: {
            if let editTransaction {
                // Load all existing data from the transaction
                title = editTransaction.title
                remarks = editTransaction.remarks
                dateAdded = editTransaction.dateAdded

                if let category = editTransaction.rawCategory {
                    self.category = category
                }
                amount = editTransaction.amount

                if let tint  = editTransaction.tint {
                    self.tint = tint
                }
            }
        })
    }

    func save() {
        if editTransaction != nil {
            editTransaction?.title = title
            editTransaction?.remarks = remarks
            editTransaction?.amount = amount
            editTransaction?.category = category.rawValue
            editTransaction?.dateAdded = dateAdded
        } else {
            let transaction = Transaction(
                title: title, remarks: remarks,
                amount: amount, dateAdded: dateAdded,
                category: category, tintColor: tint)
            context.insert(transaction)
        }

        dismiss()
    }

    @ViewBuilder
    func CustomSection(_ title: String, _ hint: String, value: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .hSpacing(.leading)

            TextField(hint, text: value)
                .padding(.horizontal, 15)
                .padding(.vertical, 12)
                .background(.background, in: .rect(cornerRadius: 10))
        })
    }

    // Custom Check Box
    @ViewBuilder
    func CategoryCheckBox() -> some View {
        HStack(spacing: 10) {
            ForEach(Category.allCases, id: \.rawValue) { category in
                HStack(spacing: 5) {
                    ZStack {
                        Image(systemName: "circle")
                            .font(.title3)
                            .foregroundStyle(appTint)

                        if self.category == category {
                            Image(systemName: "circle.fill")
                                .font(.caption)
                                .foregroundStyle(appTint)
                        }
                    }
                    Text(category.rawValue)
                        .font(.caption)
                }
                .contentShape(.rect)
                .onTapGesture {
                    self.category = category
                }
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 12)
        .hSpacing(.leading)
        .background(.background, in: .rect(cornerRadius: 10))
    }

    // Number Formatter
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2

        return formatter
    }
}

#Preview {
    NavigationStack {
        NewExpenseView()
    }
}
