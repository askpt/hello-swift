//
//  UserDetailView.swift
//  Friendface
//
//  Created by Andre Silva on 12/05/2022.
//

import SwiftUI

struct UserDetailView: View {
    let selectedUser: CachedUser
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    var body: some View {
        VStack {
            Text("Age: \(selectedUser.age)")
                .padding([.top, .horizontal])
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Email: \(selectedUser.wrappedEmail)")
                .font(.headline)
                .padding([.horizontal])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(selectedUser.wrappedAbout)")
                .padding()
            
            
            Section(header: Text("Friends List")
                .font(.title3)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)) {
                    List(selectedUser.friendsArray, id: \.id) { friend in
                        NavigationLink(
                            destination: UserDetailView(selectedUser: getUser(userId: friend.wrappedId))) {
                                Text(friend.wrappedName)
                            }
                    }
                }
        }
        .navigationBarTitle(selectedUser.wrappedName)
    }
    
    private func getUser(userId: UUID) -> CachedUser {
        users.first { (User) -> Bool in
            User.id == userId
        }!
    }
}
