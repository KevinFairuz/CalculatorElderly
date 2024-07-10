//
//  BudgetingView.swift
//  Calculator
//
//  Created by Kevin Fairuz on 10/07/24.
//

import SwiftUI

import SwiftUI

struct BudgetSettingsView: View {
    @ObservedObject var viewModel: BudgetViewModel
    @AppStorage("isCalculatorSheetPresented") private var isCalculatorSheetPresented = false // Add @AppStorage

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.budgetCategories.indices, id: \.self) { index in
                        HStack {
                            Text(viewModel.budgetCategories[index].category.rawValue)
                            Spacer()
                            TextField("Amount", value: $viewModel.budgetCategories[index].allocatedAmount, formatter: NumberFormatter())
                                .keyboardType(.decimalPad)
                        }
                    }
                }
                .navigationTitle("Budget Settings")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            viewModel.saveBudgetCategories()
                        }
                    }
                }

                Button(action: {
                    isCalculatorSheetPresented = true // Show the calculator sheet
                }) {
                    Text("Add Expense")
                }
                .padding()
            }
            .sheet(isPresented: $isCalculatorSheetPresented) { // Add the sheet modifier
                CalculatorSheet(viewModel: viewModel)
            }
        }
    }
}
