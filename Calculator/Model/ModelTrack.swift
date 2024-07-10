//
//  ModelTrack.swift
//  Calculator
//
//  Created by Kevin Fairuz on 08/07/24.
//

import SwiftData
import Foundation
import SwiftUICore

@Model
final class Expense {
    var id: UUID
    var category: ExpenseCategory
    var amount: Double
    var date: Date

    init(id: UUID = UUID(), category: ExpenseCategory, amount: Double, date: Date = Date()) {
        self.id = id
        self.category = category
        self.amount = amount
        self.date = date
    }
}

enum ExpenseCategory: String, CaseIterable, Codable, Identifiable {
    case household = "House Hold"
    case health = "Health"
    case other = "Others"
    case savings = "Saving"

    var id: String { self.rawValue }

    var icon: String {
        switch self {
        case .household: return "house.fill"
        case .health: return "heart.fill"
        case .other: return "ellipsis"
        case .savings: return "banknote.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .household: return .green
        case .health: return .blue
        case .other: return .orange
        case .savings: return .purple
        }
    }
}

@Model
final class BudgetCategory {
    var id: UUID
    var category: ExpenseCategory
    var allocatedAmount: Double

    init(id: UUID = UUID(), category: ExpenseCategory, allocatedAmount: Double) {
        self.id = id
        self.category = category
        self.allocatedAmount = allocatedAmount
    }
}

