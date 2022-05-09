//
//  ContentView.swift
//  CoreDataExamples
//
//  Created by Andre Silva on 09/05/2022.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        // Example 1
        //        List {
        //            ForEach([2, 4, 6, 8, 10], id: \.self) {
        //                Text("\($0) is even")
        //            }
        //        }
        
        // Example 2
        //        List(students, id: \.self) { student in
        //            Text(student.name)
        //        }
        
        // Example 3
        //        Button("Save") {
        //            if moc.hasChanges {
        //                try? moc.save()
        //            }
        //        }
        
        // Example 4
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
