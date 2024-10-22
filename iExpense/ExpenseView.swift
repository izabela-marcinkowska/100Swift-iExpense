//
//  ExpenseView.swift
//  iExpense
//
//  Created by Izabela Marcinkowska on 2024-10-22.
//

import SwiftUI
import SwiftData

struct ExpenseView: View {
    @Query var expenses: [Expense]
    @Environment(\.modelContext) var modelContext
    
    init(filterType: String, sortOrder: [SortDescriptor<Expense>]) {
        _expenses = Query(filter: #Predicate<Expense> { expense in
            expense.type == filterType
        },
        sort: sortOrder
        )
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            modelContext.delete(expense)
        }
    }
    
    var body: some View {
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
        }
    }
}

#Preview {
    ExpenseView(filterType: "Business", sortOrder: [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount)
    ])
}
