//
//  DataController.swift
//  Friendface
//
//  Created by Andre Silva on 13/05/2022.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CachedModels")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
