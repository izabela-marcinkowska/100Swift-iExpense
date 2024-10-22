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
    @State private var showingBussinessExpenses: Bool = false
    
    var body: some View {
        NavigationStack {
            ExpenseView(filterType: showingBussinessExpenses ? "Business" : "Personal")
            .navigationTitle("iExpense")
                .toolbar {
                    NavigationLink("Add new") {
                        AddView()
                    }
                    Button(showingBussinessExpenses ? "Show Personal" : "Show  Bussiness") {
                        showingBussinessExpenses.toggle()
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
