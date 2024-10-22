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
    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount)
    ]
    @Environment(\.modelContext) var modelContext
    @State private var showingBussinessExpenses: Bool = false
    
    var body: some View {
        NavigationStack {
            ExpenseView(filterType: showingBussinessExpenses ? "Business" : "Personal", sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .toolbar {
                    NavigationLink("Add new") {
                        AddView()
                    }
                    Button(showingBussinessExpenses ? "Show Personal" : "Show  Bussiness") {
                        showingBussinessExpenses.toggle()
                    }
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        
                        
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by name")
                                .tag([
                                    SortDescriptor(\Expense.name),
                                    SortDescriptor(\Expense.amount)
                                ])
                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\Expense.amount),
                                    SortDescriptor(\Expense.name)
                                ])
                        }
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
