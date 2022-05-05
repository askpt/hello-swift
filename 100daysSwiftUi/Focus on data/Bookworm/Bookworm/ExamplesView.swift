//
//  ExamplesView.swift
//  Bookworm
//
//  Created by Andre Silva on 05/05/2022.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ExamplesView: View {
    @State private var rememberMe = false
    @AppStorage("notes") private var notes = ""
    //    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    //    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        // Example 1
        //        VStack {
        //            PushButton(title: "Remember Me", isOn: $rememberMe)
        //            Text(rememberMe ? "On" : "Off")
        //        }
        
        // Example 2
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
        
        // Examples 3
        //        VStack {
        //            List(students) { student in
        //                Text(student.name ?? "Unknown")
        //            }
        //
        //            Button("Add") {
        //                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
        //                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
        //
        //                let chosenFirstName = firstNames.randomElement()!
        //                let chosenLastName = lastNames.randomElement()!
        //
        //                let student = Student(context: moc)
        //                student.id = UUID()
        //                student.name = "\(chosenFirstName) \(chosenLastName)"
        //
        //                try? moc.save()
        //            }
        //        }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
