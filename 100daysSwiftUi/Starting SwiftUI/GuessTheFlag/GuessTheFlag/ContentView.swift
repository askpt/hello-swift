//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Andre Silva on 02/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        // Example 1
        //        VStack(alignment: .leading, spacing: 20) {
        //            Text("Hello, world!")
        //            Text("This is another text view")
        //        }
        
        // Example 2
        //        HStack(spacing: 20) {
        //            Text("Hello, world!")
        //            Text("This is another text view")
        //        }
        
        // Example 3
        //        HStack(spacing: 20) {
        //            Text("Hello, world!")
        //            Text("This is another text view")
        //        }
        
        // Example 4
        //        VStack {
        //            Spacer()
        //            Text("One")
        //            Text("Two")
        //            Text("Three")
        //            Spacer()
        //            Spacer()
        //        }
        
        // Example 5
        //        ZStack {
        //            Text("Hello, World!")
        //            Text("This is inside a stack")
        //        }
        
        // Example 6
        //        VStack {
        //            HStack {
        //                Text("1")
        //                Text("2")
        //                Text("3")
        //            }
        //            HStack {
        //                Text("4")
        //                Text("5")
        //                Text("6")
        //            }
        //            HStack {
        //                Text("7")
        //                Text("8")
        //                Text("9")
        //            }
        //        }
        
        // Example 7
        //        ZStack {
        //            Color.red
        //                .frame(width: 200, height: 200)
        //            Text("Your content")
        //        }
        
        // Example 8
        //        ZStack {
        //            Color.blue
        //                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
        //            Text("Your content")
        //        }
        
        // Example 9
        //        ZStack {
        //            Color.primary
        //        }
        
        // Example 10
        //        ZStack {
        //            Color.blue
        //            Color.secondary
        //        }
        
        // Example 11
        //        ZStack {
        //            Color(red: 1, green: 0.8, blue: 0)
        //            Text("your content")
        //        }.ignoresSafeArea()
        
        // Example 12
        //        ZStack {
        //            VStack(spacing: 0) {
        //                Color.red
        //                Color.blue
        //            }
        //            Text("Your context")
        //                .foregroundStyle(.secondary)
        //                .padding(50)
        //                .background(.ultraThinMaterial)
        //        }
        
        // Example 13
        //        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
        
        // Example 14
        //        LinearGradient(gradient: Gradient(stops: [
        //            .init(color: .white, location: 0.45),
        //            Gradient.Stop(color: .black, location: 0.55),
        //        ]), startPoint: .top, endPoint: .bottom)
        
        // Example 15
        //        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
        // Example 16
        //        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        
        // Example 17
        //        Button("Delete selection", role: .destructive, action: executeDelete)
        
        // Example 18
        //        VStack {
        //            Button("Button 1"){}
        //                .buttonStyle(.bordered)
        //            Button("Button 2", role: .destructive){}
        //                .buttonStyle(.bordered)
        //            Button("Button 3"){}
        //                .buttonStyle(.borderedProminent)
        //                .tint(.mint)
        //            Button("Button 4", role: .destructive){}
        //                .buttonStyle(.borderedProminent)
        //        }
        
        // Example 19
        //        VStack {
        //            Button {
        //                print("Button was tapped!")
        //            } label: {
        //                Text("Tap me!")
        //                    .padding()
        //                    .foregroundColor(.white)
        //                    .background(.red)
        //            }
        //        }
        
        // Example 20
        //        Image(systemName: "pencil")
        
        // Example 21
        //        VStack {
        //            Button {
        //                print("Button was tapped!")
        //            } label: {
        //                Label("Edit", systemImage: "pencil")
        //            }
        //        }
        
        // Example 22
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this")
        }
    }
}

func executeDelete() {
    print("Now deleting")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
