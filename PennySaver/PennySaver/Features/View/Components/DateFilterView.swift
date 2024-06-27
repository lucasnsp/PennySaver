//
//  DateFilterView.swift
//  PennySaver
//
//  Created by Lucas Neves dos santos pompeu on 25/06/24.
//

import SwiftUI

struct DateFilterView: View {
    @State var start: Date
    @State var end: Date
    var onSubmit: (Date, Date) -> ()
    var onClose: () -> ()
    var body: some View {
        VStack(spacing: 15) {
            DatePicker("Data de inicio:", selection: $start, displayedComponents: [.date])

            DatePicker("Data final:", selection: $end, displayedComponents: [.date])

            HStack(spacing: 15) {
                Button("Cancelar") {
                    onClose()
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(.red)

                Button("Filtrar") {
                    onSubmit(start, end)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 5))
                .tint(.gray)
            }
            .padding(.top, 10)
        }
        .padding(15)
        .background(.bar, in: .rect(cornerRadius: 10))
        .padding(.horizontal, 30)
    }
}
