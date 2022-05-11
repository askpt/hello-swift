//
//  FilteredList.swift
//  CoreDataExamples
//
//  Created by Andre Silva on 10/05/2022.
//

import CoreData
import SwiftUI

struct FilteredList<T : NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(sortDescriptors: [SortDescriptor<T>], filterKey: String, predicate: Predicate, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        let predicateStr = "%K \(predicate.rawValue) %@"
        
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: predicateStr, filterKey, filterValue))
        self.content = content
    }
}
