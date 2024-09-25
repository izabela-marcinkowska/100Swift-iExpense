//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Izabela Marcinkowska on 2024-09-25.
//

import Foundation

struct ExpenseItem: Identifiable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

