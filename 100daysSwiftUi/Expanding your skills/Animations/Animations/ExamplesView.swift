//
//  ExamplesView.swift
//  Animations
//
//  Created by Andre Silva on 14/04/2022.
//

import SwiftUI

struct CornerRotateModifier : ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ExamplesView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    @State private var isShowingRed = false
    
    let letters = Array("Hello, SwiftUI")
    
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
        //        Button("Tap me") {
        //            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
        //                animationAmount += 360
        //            }
        //        }
        //        .padding(50)
        //        .background(.red)
        //        .foregroundColor(.white)
        //        .clipShape(Circle())
        //        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 1))
        
        // Example 5
        //        Button("Tap Me") {
        //            enabled.toggle()
        //        }
        //        .frame(width: 200, height: 200)
        //        .background(enabled ? .blue : .red)
        //        .animation(nil, value: enabled)
        //        .foregroundColor(.white)
        //        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        //        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        
        // Example 6
        //        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
        //            .frame(width: 300, height: 200)
        //            .clipShape(RoundedRectangle(cornerRadius: 10))
        //            .offset(dragAmount)
        //            .gesture(DragGesture()
        //                .onChanged {dragAmount = $0.translation}
        //                .onEnded{_ in
        //                    withAnimation {
        //                        dragAmount = .zero
        //                    }
        //                })
        
        // Example 7
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation }
//                .onEnded { _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                }
//        )
        
        // Example 8
//        VStack {
//            Button("Tap Me") {
//                withAnimation() {
//                    isShowingRed.toggle()
//                }
//            }
//
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//
//        }
        
        // Example 9
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
            
        }.onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
