//
//  ExampleView.swift
//  BucketList
//
//  Created by Andre Silva on 23/05/2022.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ExampleView: View {
    let values = [1, 5, 3, 6, 2, 9].sorted()
    
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()
    
    var loadingState = LoadingState.loading
    
    var body: some View {
        // Example 1
        //        List(values, id: \.self) {
        //            Text(String($0))
        //        }
        
        // Example 2
        //        List(users) { user in
        //            Text("\(user.firstName) \(user.lastName)")
        //        }
        
        // Example 3
        //        Text("Hello world")
        //            .onTapGesture {
        //                let str = "Test message"
        //                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
        //
        //                do {
        //                    try str.write(to: url, atomically: true, encoding: .utf8)
        //
        //                    let input = try String(contentsOf: url)
        //
        //                    print(input)
        //                } catch {
        //                    print(error.localizedDescription)
        //                }
        //            }
        
        // Example 4
        //        if Bool.random() {
        //            Rectangle()
        //        } else {
        //            Circle()
        //        }
        
        // Example 5
        if loadingState == .loading {
            LoadingView()
        } else if loadingState == .success {
            SuccessView()
        } else if loadingState == .failed {
            FailedView()
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    //    func example() {
    //        let result = 4 < 5
    //    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView()
    }
}
