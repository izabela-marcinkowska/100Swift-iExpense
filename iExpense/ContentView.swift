//
//  ContentView.swift
//  iExpense
//
//  Created by Izabela Marcinkowska on 2024-09-22.
//

import SwiftUI

@Observable
class Expenses{
    var items: [ExpenseItem] = []
}


struct ContentView: View {
    @State private var expenses = Expenses()
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
                
            }.navigationTitle("iExpense")
                .toolbar {
                    Button("Add expense", systemImage: "plus") {
                        let expense = ExpenseItem(name: "Test", type: "personal", amount: 10)
                        expenses.items.append(expense)
                    }
                }

        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
