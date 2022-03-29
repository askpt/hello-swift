//
//  Overview.swift
//  WeSplit
//
//  Created by Andre Silva on 29/03/2022.
//

import SwiftUI

struct Overview: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                }

                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                
                Group {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Button("Tap Count: \(tapCount)") {
                        tapCount += 1
                    }
                }
                
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                
                Section {
                    ForEach(0..<100) {
                        Text("Row \($0)")
                    }
                }
                
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                                        ForEach(students, id: \.self) {
                                            Text($0)
                                        }
                                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
    }
}
