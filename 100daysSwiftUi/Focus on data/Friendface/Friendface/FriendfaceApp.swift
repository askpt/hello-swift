//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Andre Silva on 12/05/2022.
//

import SwiftUI

@main
struct FriendfaceApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
