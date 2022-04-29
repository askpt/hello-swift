//
//  AddActivityView.swift
//  iHabits
//
//  Created by Andre Silva on 29/04/2022.
//

import SwiftUI

struct AddActivityView : View {
    @ObservedObject var activities: Activities
    
    @State private var name = ""
    @State private var description = ""
    
    @Environment( \.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                Button("Save") {
                    let item = Activity(name: name, description: description)
                    
                    activities.items.append(item)
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
