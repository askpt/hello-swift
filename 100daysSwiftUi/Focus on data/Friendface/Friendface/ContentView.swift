//
//  ContentView.swift
//  Friendface
//
//  Created by Andre Silva on 12/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { item in
                NavigationLink {
                    UserDetailView(selectedUser: item, users: users)
                } label: {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.isActive ? "Active" : "Not Active")
                    }
                }
            }
            .task {
                await loadData()
            }
            .navigationBarTitle("Friendface")
        }
    }
    
    func loadData() async {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            fatalError("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
