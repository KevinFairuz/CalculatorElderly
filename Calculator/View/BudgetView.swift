//
//  ContentView.swift
//  TesBudgetView
//
//  Created by Kevin Fairuz on 10/07/24.
//

import SwiftUI
import SwiftData

struct BudgetView: View {
    @StateObject var viewModel = BudgetViewModel()
    @Environment(\.locale) var locale
    @State private var isUpdateBalanceSheetPresented = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Account Balance Section
                VStack(alignment: .center, spacing: 5) {
                    Text("Account Balance")
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text("IDR \(viewModel.accountBalance, specifier: "%.2f")")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    NavigationLink(destination: UpdateAccountView(viewModel: viewModel)) { // NavigationLink
                        Text("Update")
                    }
                    .padding(.top, 5)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(10)

                // Expenses Section
                Text("Expenses")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                    ForEach(ExpenseCategory.allCases) { category in
                        ExpenseCategoryView(category: category, viewModel: viewModel)
                            .onTapGesture {
                                self.$viewModel.selectedCategory.wrappedValue = category // Set selected category
                                viewModel.isCalculatorSheetPresented = true
                            }
                    }
                }
                .padding(.horizontal)
                
                NavigationLink(destination: CalculatorSheet(viewModel: viewModel)) {
                    Text(LocalizedStringKey("Add Expense"))
                }
                .buttonStyle(.borderedProminent)
                .padding()
                Spacer()
                


            }
            .padding()
            .navigationTitle("SeniorBudget")

        }
    }
}

struct ExpenseCategoryView: View {
    let category: ExpenseCategory
    @ObservedObject var viewModel: BudgetViewModel

    var body: some View {
        VStack {
            Image(systemName: category.icon)
                .font(.largeTitle)
                .foregroundColor(.white)
            Text(category.rawValue)
                .font(.headline)
                .foregroundColor(.white)
            Text("IDR \(viewModel.remainingBudgetForCategory(category), specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(category.color)
        .cornerRadius(10)
        .onTapGesture {
            // self.$viewModel.selectedCategory.wrappedValue = category // Corrected access
            viewModel.selectedCategory = category // Directly assign the value
            viewModel.isCalculatorSheetPresented = true
        }
    }
}



#Preview {
    TabBarView()
}
