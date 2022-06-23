//
//  ContentView.swift
//  RollDice
//
//  Created by Andre Silva on 23/06/2022.
//

import Combine
import CoreHaptics
import SwiftUI

struct ContentView: View {
    @State private var maxSides = 6
    @State private var result: Int? = nil
    @State private var engine: CHHapticEngine?
    @State private var counter = 0
    @State var timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common)
    @State var connectedTimer: Cancellable? = nil
    @State var allResults = [Int]()
    @State var showingSheet = false
    @State var isRolling = false
    
    private let possibleSides = [4, 6, 8, 10, 12, 20, 100]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Picker(selection: $maxSides, label: Text("Number of sides")) {
                            ForEach(0..<possibleSides.count, id: \.self) { index in
                                Text("\(possibleSides[index])").tag(possibleSides[index])
                            }
                        }
                    }
                }
                
                Button {
                    simpleSuccess()
                    counter = 5
                    timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common)
                    connectedTimer = timer.connect()
                    isRolling.toggle()
                } label: {
                    Text("Roll the dice")
                }
                .padding()
                Spacer()
                
                if isRolling {
                    Text(result != nil ? "Rolling... \(result!)" : "Rolling...")
                        .font(.largeTitle)
                } else {
                    Text(result != nil ? "Result: \(result!)" : "No Result")
                        .font(.largeTitle)
                }
                
            }
            .navigationTitle("Roll Dice")
            .onAppear(perform: prepareHaptics)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showingSheet = true
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.right.circle")
                    })
                }
            }
            .sheet(isPresented: $showingSheet) {
                Text("Results:")
                    .font(.largeTitle)
                    .padding()
                List(allResults, id: \.self) { item in
                    Text("\(item)")
                }
            }
            .onReceive(timer) { time in
                if counter > 0 {
                    result = Int.random(in: 1...maxSides)
                    counter -= 1
                } else if counter == 0 && result != nil {
                    allResults.append(result!)
                    isRolling.toggle()
                    connectedTimer?.cancel()
                }
            }
        }
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
