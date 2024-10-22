//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Izabela Marcinkowska on 2024-09-25.
//

import Foundation
import SwiftData

@Model
class Expense {
    var id: UUID
    var name: String
    var type: String
    var amount: Double
    
    init(id: UUID, name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
    
}
