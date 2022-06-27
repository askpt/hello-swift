//
//  ExamplesView.swift
//  SnowSeeker
//
//  Created by Andre Silva on 27/06/2022.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct ExamplesView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    @State private var layoutVertically = false
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var searchText = ""
    
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var body: some View {
        // Example 1
        //        NavigationView {
        //            NavigationLink {
        //                Text("New Secondary")
        //            } label: {
        //                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //
        //            }
        //            .navigationTitle("Primary")
        //
        //            Text("Secondary")
        //
        //            Text("Tertiary")
        //        }
        
        // Example 2
        //        Text("AAA")
        //            .onTapGesture {
        //                selectedUser = User()
        //            }
        //            .sheet(item: $selectedUser) { user in
        //                Text(user.id)
        //            }
        
        // Example 3
        //        Text("AAA")
        //            .onTapGesture {
        //                selectedUser = User()
        //                isShowingUser = true
        //            }
        //            .alert("AAA", isPresented: $isShowingUser, presenting: selectedUser) { user in
        //                Text(user.id)
        //            }
        
        // Example 4
        //        Group {
        //            if layoutVertically {
        //                VStack {
        //                    UserView()
        //                }
        //            } else {
        //                HStack {
        //                    UserView()
        //                }
        //            }
        //        }
        //        .onTapGesture {
        //            layoutVertically.toggle()
        //        }
        
        // Example 5
        //        if sizeClass == .compact {
        //            VStack {
        //                UserView()
        //            }
        //        } else {
        //            HStack {
        //                UserView()
        //            }
        //        }
        
        // Example 6
        NavigationView {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
        
    }
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
