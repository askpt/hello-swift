//
//  ContentView.swift
//  Friendface
//
//  Created by Andre Silva on 12/05/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
//    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { item in
                NavigationLink {
                    UserDetailView(selectedUser: item)
                } label: {
                    VStack(alignment: .leading) {
                        Text(item.wrappedName)
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
                await MainActor.run {
                    for user in decodedResponse {
                        let cachedUser = CachedUser(context: moc)
                        cachedUser.id = user.id
                        cachedUser.name = user.name
                        cachedUser.email = user.email
                        cachedUser.registered = user.registered
                        cachedUser.isActive = user.isActive
                        cachedUser.about = user.about
                        cachedUser.address = user.address
                        cachedUser.age = Int16(user.age)
                        
                        for friend in user.friends {
                            let cachedFriend = CachedFriend(context: moc)
                            
                            cachedFriend.id = friend.id
                            cachedFriend.name = friend.name
                            
                            cachedUser.addToFriends(cachedFriend)
                        }
                    }
                    if moc.hasChanges {
                        try? moc.save()
                    }
                }
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
