//
//  ExamplesView.swift
//  Animations
//
//  Created by Andre Silva on 14/04/2022.
//

import SwiftUI

struct ExamplesView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        //        print(animationAmount)
        // Example 1
        //        Button("Tap me") {
        //            animationAmount += 1
        //        }
        //        .padding(50)
        //        .background(.red)
        //        .foregroundColor(.white)
        //        .clipShape(Circle())
        //        .scaleEffect(animationAmount)
        //        .blur(radius: (animationAmount - 1) * 3)
        //        .animation(
        //            .easeInOut(duration: 2)
        //            .repeatCount(3, autoreverses: true)
        //            .delay(1),
        //            value: animationAmount)
        
        // Example 2
        //        Button("Tap me") {
        //        }
        //        .padding(50)
        //        .background(.red)
        //        .foregroundColor(.white)
        //        .clipShape(Circle())
        //        .overlay(
        //            Circle()
        //                .stroke(.red)
        //                .scaleEffect(animationAmount)
        //                .opacity(2 - animationAmount)
        //                .animation(
        //                    .easeInOut(duration: 1)
        //                    .repeatForever(autoreverses: false),
        //                    value: animationAmount)
        //        )
        //        .onAppear {
        //            animationAmount = 2
        //        }
        
        // Example 3
        //        return VStack {
        //            Stepper("Scale amount", value: $animationAmount.animation(
        //                .easeInOut(duration: 1)
        //                .repeatCount(3, autoreverses: true)), in: 1...10)
        //
        //            Spacer()
        //
        //            Button("Tap Me") {
        //                animationAmount += 1
        //            }
        //            .padding(50)
        //            .background(.red)
        //            .foregroundColor(.white)
        //            .clipShape(Circle())
        //            .scaleEffect(animationAmount)
        //        }
        
        // Example 4
        Button("Tap me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 1))
        
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
