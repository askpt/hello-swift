//
//  ActivitiesList.swift
//  iHabits
//
//  Created by Andre Silva on 29/04/2022.
//

import Foundation

class Activities : ObservableObject {
    @Published var items = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
            
        items = []
    }
}
