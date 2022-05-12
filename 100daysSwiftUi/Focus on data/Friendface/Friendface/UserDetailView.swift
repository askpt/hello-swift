//
//  UserDetailView.swift
//  Friendface
//
//  Created by Andre Silva on 12/05/2022.
//

import SwiftUI

struct UserDetailView: View {
    let selectedUser: User
    let users: [User]
    
    var body: some View {
        VStack {
            Text("Age: \(selectedUser.age)")
                .padding([.top, .horizontal])
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Email: \(selectedUser.email)")
                .font(.headline)
                .padding([.horizontal])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(selectedUser.about)")
                .padding()
            
            
            Section(header: Text("Friends List")
                .font(.title3)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)) {
                    List(selectedUser.friends, id: \.id) { friend in
                        NavigationLink(
                            destination: UserDetailView(selectedUser: getUser(userId: friend.id) , users: users)) {
                                Text(friend.name)
                            }
                    }
                }
        }
        .navigationBarTitle(selectedUser.name)
    }
    
    private func getUser(userId: UUID) -> User {
        users.first { (User) -> Bool in
            User.id == userId
        }!
    }
}
