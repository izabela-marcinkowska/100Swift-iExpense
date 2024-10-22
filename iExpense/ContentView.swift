//
//  ContentView.swift
//  iExpense
//
//  Created by Izabela Marcinkowska on 2024-09-22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var expenses: [Expense]
    @State private var showingAddExpense = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                Section ("Personal Expenses") {
                    ForEach(expenses) { item in
                        if(item.type == "Personal") {
                            HStack {
                                VStack (alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle(item.amount < 100 ? .green : .red)
                            }
                        }
                    }.onDelete(perform: removeItems)
                }
                Section ("Business Expenses") {
                    ForEach(expenses) { item in
                        if(item.type == "Business") {
                            HStack {
                                VStack (alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle(item.amount < 100 ? .green : .red)
                            }
                        }
                    }.onDelete(perform: removeItems)
                }
            }.navigationTitle("iExpense")
                .toolbar {
                    NavigationLink("Add new") {
                        AddView()
                    }
                }
                
        }
    }
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
}

#Preview {
    ContentView()
}
