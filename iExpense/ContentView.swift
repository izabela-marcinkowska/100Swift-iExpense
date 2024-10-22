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
            ExpenseView(filterType: "Business")
            .navigationTitle("iExpense")
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
