//
//  ExamplesView.swift
//  Hot Prospects
//
//  Created by Andre Silva on 05/06/2022.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct ExamplesView: View {
    @StateObject private var user = User()
    @State private var selectedTab = "One"
    
    var body: some View {
        // Example 1
        //        VStack {
        //            EditView().environmentObject(user)
        //            DisplayView().environmentObject(user)
        //        }
        
        // Example 2
        //        VStack {
        //            EditView()
        //            DisplayView()
        //        }.environmentObject(user)
        
        // Example 3
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
