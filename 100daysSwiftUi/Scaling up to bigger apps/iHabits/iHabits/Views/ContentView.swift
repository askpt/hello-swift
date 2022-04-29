//
//  ContentView.swift
//  iHabbits
//
//  Created by Andre Silva on 29/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    
    @State var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List(activities.items) { activity in
                NavigationLink {
                    ActivityDetailView(activities: activities, activity: activity)
                } label: {
                    Text(activity.name)
                }
            }
            .navigationTitle("iHabbits")
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivityView(activities: activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
