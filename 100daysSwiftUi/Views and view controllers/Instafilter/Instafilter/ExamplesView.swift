//
//  ExamplesView.swift
//  Instafilter
//
//  Created by Andre Silva on 14/05/2022.
//

import SwiftUI

struct ExamplesView: View {
    @State private var blurAmount = 0.0
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        // Example 1
        //        VStack {
        //            Text("Hello, world!")
        //                .blur(radius: blurAmount)
        //
        //            Slider(value: $blurAmount, in: 1...20)
        //
        //            Button("Random Blur") {
        //                blurAmount = Double.random(in: 1...20)
        //            }
        //        }
        //        .onChange(of: blurAmount) { newValue in
        //            print("New value is \(newValue)")
        //        }
        
        // Example 2
        Text("Hello world")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                showingConfirmation = true
            }
            .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                Button("Red") { backgroundColor = .red }
                Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select a new color")
            }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
