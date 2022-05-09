//
//  CoreDataExamplesApp.swift
//  CoreDataExamples
//
//  Created by Andre Silva on 09/05/2022.
//

import SwiftUI

@main
struct CoreDataExamplesApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
