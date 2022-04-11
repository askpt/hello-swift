//
//  ExamplesView.swift
//  WordScramble
//
//  Created by Andre Silva on 11/04/2022.
//

import SwiftUI

struct ExamplesView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        
        // Example 1
        //        List {
        //            Section("Section 1") {
        //                Text("Static row 1")
        //                Text("Static row 2")
        //            }
        //
        //            Section("Section 2") {
        //                ForEach(0..<5) {
        //                    Text("Dynamic row \($0)")
        //                }
        //            }
        //
        //            Section("Section 3"){
        //                Text("Static row 3")
        //                Text("Statoc row 4")
        //            }
        //        }.listStyle(.grouped)
        
        // Example 2
        //        List(0..<5) {
        //            Text("Dynamic row \($0)")
        //        }.listStyle(.grouped)
        
        // Example 3
        //        List(people, id:\.self) {
        //            Text($0)
        //        }
        
        // Example 4
        List {
            Text("Static row")
            
            ForEach(people, id: \.self) {
                Text($0)
            }
            
            Text("Static row")
        }
    }
    
    func loadFile() {
        if let fileUrl = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileUrl) {
                print(fileContents)
            }
        }
    }
    
    func test() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        let letter = letters.randomElement()
        
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        print(trimmed ?? "")
    }
    
    func test2() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
        print(allGood)
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
