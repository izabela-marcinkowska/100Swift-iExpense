//
//  ContentView.swift
//  iExpense
//
//  Created by Izabela Marcinkowska on 2024-09-22.
//

import SwiftUI

@Observable
class Expenses{
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
        
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}


struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section ("Personal Expenses") {
                    ForEach(expenses.items) { item in
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
                    ForEach(expenses.items) { item in
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
                        AddView(expenses: expenses)
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
