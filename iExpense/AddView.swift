//
//  AddView.swift
//  iExpense
//
//  Created by Izabela Marcinkowska on 2024-09-25.
//

import SwiftUI

struct AddView: View {
    @State private var name = "Add new name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    let types = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Cancel") {
                    dismiss()
                }
                Button("Save") {
                    let item = Expense(id: UUID(), name: name, type: type, amount: amount)
                    print("I created: \(item.name)")
                    modelContext.insert(item)
                    print("I saved item")
                    dismiss()
                }
                
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView()
}
