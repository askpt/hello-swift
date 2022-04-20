//
//  ContentView.swift
//  iExpense
//
//  Created by Andre Silva on 18/04/2022.
//

import SwiftUI

struct ExpensesTypeView: View {
    let type: String
    let expenses: Expenses
    let removeItemsAction: Optional<(IndexSet) -> Void>
    
    var body: some View {
        VStack {
            Text("Personal")
            List {
                ForEach(expenses.items) { item in
                    if item.type == type {
                        ExpenseView(expense: item)
                    }
                }
                .onDelete(perform: removeItemsAction)
            }
        }
    }
}

struct ExpenseView: View {
    let expense: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.name)
                    .font(.headline)
                Text(expense.type)
            }
            Spacer()
            Text(expense.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .foregroundColor(expense.amount < 10 ? .green : (expense.amount < 100 ? .yellow : .red))
        }
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            VStack {
                ExpensesTypeView(type: "Personal", expenses: expenses, removeItemsAction: removeItems)
                ExpensesTypeView(type: "Business", expenses: expenses, removeItemsAction: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
