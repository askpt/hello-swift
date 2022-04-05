//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Andre Silva on 05/04/2022.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id:\.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct CapsuleText : View {
    var text: String
    
    var body : some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    @State private var useRedText = false
    
    var motto1: some View {
        Text("Draco dormiens")
    }
    let motto2 = Text("nunquam titillandus")
    
    var spells: some View {
        Group {
            Text("Lumos")
            Text("Oblivious")
        }
    }
    
    @ViewBuilder var spells2: some View {
        Text("Lumos")
        Text("Oblivious")
    }
    
    var body: some View {
        // Example 1
        //        Button("Hello, world!") {
        //            print(type(of: self.body))
        //        }
        //        .frame(width: 200, height: 200)
        //        .background(.red)
        
        // Example 2
        //        Text("Hello, world!")
        //            .padding()
        //            .background(.red)
        //            .padding()
        //            .background(.blue)
        //            .padding()
        //            .background(.green)
        //            .padding()
        //            .background(.yellow)
        
        // Example 3
        //        Button("Hello, world!") {
        //            print(type(of: self.body))
        //        }
        //        .frame(width: 200, height: 200)
        //        .background(.red)
        
        // Example 4
        //        Button("Hello, world!") {
        //            useRedText.toggle()
        //        }.foregroundColor(useRedText ? .red : .blue)
        
        // Example 5
        //        VStack {
        //            Text("Gryffindor")
        //                .font(.largeTitle)
        //            Text("Hufflepuff")
        //            Text("Ravenclaw")
        //            Text("Slytherin")
        //        }
        //        .font(.title)
        
        // Example 6
        //        VStack {
        //            motto1
        //                .foregroundColor(.red)
        //            motto2
        //                .foregroundColor(.blue)
        //        }
        
        // Example 7
        //        HStack {
        //            spells
        //        }
        
        // Example 8
        //        VStack(spacing: 10) {
        //            CapsuleText(text: "First")
        //
        //            CapsuleText(text: "Second")
        //        }
        
        // Example 9
        //        Text("Hello, world!")
        //            .modifier(Title())
        
        // Example 10
        //        Text("Hello, world!")
        //            .titleStyle()
        
        // Example 11
        //        Color.blue
        //            .frame(width: 300, height: 200)
        //            .watermarked(with: "Hacking with Swift")
        
        // Example 12
        GridStack(rows: 4, columns: 4) { row, col in
            VStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
