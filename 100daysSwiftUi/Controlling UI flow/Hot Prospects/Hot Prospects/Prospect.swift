//
//  Prospect.swift
//  Hot Prospects
//
//  Created by Andre Silva on 08/06/2022.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
    private(set) var dateAdded = Date()
    
    enum SortOption {
        case name, mostRecent
      }
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let savekey = "SavedData"
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            people = []
        }
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func sort(by option: Prospect.SortOption) {
        switch option {
          case .name:
            people.sort { $0.name < $1.name }
          case .mostRecent:
            people.sort { $0.dateAdded < $1.dateAdded }
        }
      }
}
