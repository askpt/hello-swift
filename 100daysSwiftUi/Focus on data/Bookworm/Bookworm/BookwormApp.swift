//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Andre Silva on 05/05/2022.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ExamplesView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
