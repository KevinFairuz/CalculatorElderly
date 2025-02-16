//
//  TabBarView.swift
//  Calculator
//
//  Created by Kevin Fairuz on 10/07/24.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel = BudgetViewModel()

    var body: some View {
        TabView {
            BudgetView(viewModel: viewModel)
                .tabItem {
                    Label("Budget", systemImage: "creditcard")
                }
            HistoryView(viewModel: viewModel)
                .tabItem {
                    Label("History", systemImage: "clock")
                }
            BudgetSettingsView(viewModel: viewModel)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}


#Preview {
    TabBarView()
}
