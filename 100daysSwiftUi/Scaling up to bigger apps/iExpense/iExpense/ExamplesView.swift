//
//  ContentView.swift
//  iExpense
//
//  Created by Andre Silva on 18/04/2022.
//

import SwiftUI

//class User : ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

struct User : Codable {
    let firstName: String
    let lastName: String
}

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello \(name)")
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct ExamplesView: View {
    //    @StateObject var user = User()
    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    //    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @AppStorage("tapCount") private var tapCount = 0
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        // Example 1
        //        VStack {
        //            Text("Your name is \(user.firstName) \(user.lastName)")
        //
        //            TextField("First name", text: $user.firstName)
        //            TextField("Last name", text: $user.lastName)
        //        }
        
        // Example 2
        //        Button("Show Sheet") {
        //            showingSheet.toggle()
        //        }
        //        .sheet(isPresented: $showingSheet) {
        //            SecondView(name: "Popcorn")
        //        }
        
        // Example 3
        //        NavigationView {
        //            VStack {
        //                List {
        //                    ForEach(numbers, id: \.self) {
        //                        Text("Row \($0)")
        //                    }
        //                    .onDelete(perform: removeRows)
        //                }
        //
        //                Button("Add Number") {
        //                    numbers.append(currentNumber)
        //                    currentNumber += 1
        //                }
        //            }
        //            .navigationTitle("onDelete()")
        //            .toolbar {
        //                EditButton()
        //            }
        //        }
        
        // Example 4
        //        Button("Tap count: \(tapCount)") {
        //            tapCount += 1
        //            UserDefaults.standard.set(tapCount, forKey: "Tap")
        //        }
        
        // Example 5
        //        Button("Tap count: \(tapCount)") {
        //            tapCount += 1
        //        }
        
        // Example 6
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
