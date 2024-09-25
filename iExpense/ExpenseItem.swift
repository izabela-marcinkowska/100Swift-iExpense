//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Izabela Marcinkowska on 2024-09-25.
//

import Foundation

struct ExpenseItem: Identifiable, Codable{
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}

