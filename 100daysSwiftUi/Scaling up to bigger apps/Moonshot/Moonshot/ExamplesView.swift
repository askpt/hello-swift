//
//  ExamplesView.swift
//  Moonshot
//
//  Created by Andre Silva on 21/04/2022.
//

import SwiftUI

struct CustomView: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ExamplesView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        // Example 1
        //        GeometryReader { geo in
        //            Image("example")
        //                .resizable()
        //                .scaledToFit()
        //                .frame(width: geo.size.width * 0.8)
        //                .frame(width: geo.size.width, height: geo.size.height)
        //        }
        
        // Example 2
        //        ScrollView(.vertical) {
        //            LazyVStack(spacing: 10) {
        //                ForEach(0..<100) {
        //                    CustomView("item \($0)")
        //                        .font(.title)
        //                }
        //            }
        //            .frame(maxWidth: .infinity)
        //        }
        
        // Example 3
        //        NavigationView {
        //            List(0..<100) { row in
        //                NavigationLink {
        //                    Text("Detail \(row)")
        //                } label: {
        //                    Text("Row \(row)")
        //                }
        //            }
        //            .navigationTitle("SwiftUI")
        //        }
        
        // Example 4
        //        Button("Decode JSON") {
        //            let input = """
        //            {
        //                "name": "Taylor Swift",
        //                "address": {
        //                    "street": "555, Taylor Swift Avenue",
        //                    "city": "Nashville"
        //                }
        //            }
        //            """
        //
        //            let data = Data(input.utf8)
        //
        //            if let user = try? JSONDecoder().decode(User.self, from: data) {
        //                print(user.address.street)
        //            }
        //        }
        
        // Example 5
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
