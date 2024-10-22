//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Izabela Marcinkowska on 2024-09-22.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Expense.self)
        }
    }
}
