//
//  ExamplesView.swift
//  BetterRest
//
//  Created by Andre Silva on 08/04/2022.
//

import SwiftUI

struct ExamplesView: View {
    @State private var sleepAmout = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        // Example 1
        //        Stepper("\(sleepAmout.formatted()) hours", value: $sleepAmout, in: 4...12, step: 0.25)
        
        // Example 2
        //        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
        //            .labelsHidden()
        
        // Example 3
        //        DatePicker("Please enter a time", selection: $wakeUp, in: Date.now...)
        
        // Example 4
        //        Text(Date.now, format: .dateTime.hour().minute())
        
        // Example 5
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
    //        func exampleDay() {
    //            let tomorrow = Date.now.addingTimeInterval(86400)
    //            let range = Date.now...tomorrow
    //        }
    
    //    func trivialExample() {
    //        var components = DateComponents()
    //        components.hour = 8
    //        components.minute = 0
    //
    //        let date = Calendar.current.date(from: components) ?? Date.now
    //    }
    
//    func trivialExample() {
//        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
