//
//  ExamplesView.swift
//  Flashzilla
//
//  Created by Andre Silva on 13/06/2022.
//

import CoreHaptics
import SwiftUI

struct ExamplesView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        // Example 1
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //            .onTapGesture(count: 2) {
        //                print("Double tapped!")
        //            }
        
        // Example 2
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //            .padding()
        //            .onLongPressGesture(minimumDuration: 2) {
        //                print("Long pressed!")
        //            } onPressingChanged: { inProgress in
        //                print("In progress: \(inProgress)")
        //            }
        
        // Example 3
        //        Text("Hello World")
        //            .minimumScaleFactor(finalAmount + currentAmount)
        //            .gesture(
        //                MagnificationGesture()
        //                    .onChanged { amount in
        //                        currentAmount = amount - 1
        //                    }
        //                    .onEnded { amount in
        //                        finalAmount += currentAmount
        //                        currentAmount = 0
        //                    }
        //            )
        
        // Example 4
        //        Text("Hello World")
        //            .rotationEffect(finalAmount + currentAmount)
        //            .gesture(
        //                RotationGesture()
        //                    .onChanged { angle in
        //                        currentAmount = angle
        //                    }
        //                    .onEnded { amount in
        //                        finalAmount += currentAmount
        //                        currentAmount = .zero
        //                    }
        //            )
        
        // Example 5
        //        VStack {
        //            Text("Hello world")
        //                .onTapGesture {
        //                    print("Text tapped!")
        //                }
        //        }
        //        .highPriorityGesture(
        //            TapGesture()
        //                .onEnded {
        //                    print("Vstack tapped")
        //                })
        
        // Example 6
        //        VStack {
        //            Text("Hello world")
        //                .onTapGesture {
        //                    print("Text tapped!")
        //                }
        //        }
        //        .simultaneousGesture(
        //            TapGesture()
        //                .onEnded {
        //                    print("Vstack tapped")
        //                })
        
        // Example 7
        //        let dragGesture = DragGesture()
        //            .onChanged { value in
        //                offset = value.translation
        //            }
        //            .onEnded { _ in
        //                withAnimation {
        //                    offset = .zero
        //                    isDragging = false
        //                }
        //            }
        //
        //        let pressGesture = LongPressGesture()
        //            .onEnded { value in
        //                withAnimation {
        //                    isDragging = true
        //                }
        //            }
        //
        //        let combine = pressGesture.sequenced(before: dragGesture)
        //
        //        return Circle()
        //            .fill(.red)
        //            .frame(width: 64, height: 64)
        //            .scaleEffect(isDragging ? 1.5 : 1)
        //            .offset(offset)
        //            .gesture(combine)
        
        // Example 8
        //        Text("Hello world")
        //            .onTapGesture(perform: simpleSuccess)
        
        // Example 9
        //        Text("Hello")
        //            .onAppear(perform: prepareHaptics)
        //            .onTapGesture(perform: complexSuccess)
        
        // Example 10
        //        ZStack {
        //            Rectangle()
        //                .fill(.blue)
        //                .frame(width: 300, height: 300)
        //                .onTapGesture {
        //                    print("Rectangle tapped!")
        //                }
        //
        //            Circle()
        //                .fill(.red)
        //                .frame(width: 300, height: 300)
        //                .onTapGesture {
        //                    print("Circle tapped!")
        //                }
        //                .allowsHitTesting(false)
        //        }
        
        // Example 11
        //        ZStack {
        //            Rectangle()
        //                .fill(.blue)
        //                .frame(width: 300, height: 300)
        //                .onTapGesture {
        //                    print("Rectangle tapped!")
        //                }
        //
        //            Circle()
        //                .fill(.red)
        //                .frame(width: 300, height: 300)
        //                .contentShape(Rectangle())
        //                .onTapGesture {
        //                    print("Circle tapped!")
        //                }
        //        }
        
        // Example 12
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
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
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        for i in stride(from: 0, through: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern \(error.localizedDescription)")
        }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
