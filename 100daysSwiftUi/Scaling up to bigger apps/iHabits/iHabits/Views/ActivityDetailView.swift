//
//  ActivityDetailView.swift
//  iHabits
//
//  Created by Andre Silva on 29/04/2022.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var activities: Activities
    @State var activity: Activity
    
    var body: some View {
        Form {
            Section("Name") {
                Text(activity.name)
            }
            Section("Description") {
                Text(activity.description)
            }
            Section("Completion times") {
                Stepper {
                    Text("\(activity.completionTimes)")
                } onIncrement: {
                    let index = activities.items.firstIndex(of: activity)
                    if index == nil {
                        fatalError("Activity is not in the list")
                    }
                    
                    activity.completionTimes += 1
                    activities.items[index!] = activity
                } onDecrement: {
                    // do nothing
                }
            }
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static let activity = Activity(name: "Act1", description: "Desc1")
    static let activities = Activities()
    
    static var previews: some View {
        ActivityDetailView(activities: activities, activity: activity)
    }
}
