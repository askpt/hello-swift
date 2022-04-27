//
//  ExamplesView.swift
//  Drawing
//
//  Created by Andre Silva on 25/04/2022.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Flower: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(gradient: Gradient(colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5)]), startPoint: .top, endPoint: .bottom),
                        lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        }
        set {
            rows = Int(newValue.first)
            columns = Int(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct ExamplesView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    @State private var colorCycle = 0.0
    @State private var amount = 0.0
    
    @State private var insetAmount = 50.0
    
    @State private var rows = 4
    @State private var columns = 4
    
    var body: some View {
        // Example 1
        //        Path { path in
        //            path.move(to: CGPoint(x: 200, y: 100))
        //            path.addLine(to: CGPoint(x: 100, y: 300))
        //            path.addLine(to: CGPoint(x: 300, y: 300))
        //            path.addLine(to: CGPoint(x: 200, y: 100))
        //            path.closeSubpath()
        //        }
        //        .stroke(.blue, lineWidth: 10)
        
        // Example 2
        //        Path { path in
        //            path.move(to: CGPoint(x: 200, y: 100))
        //            path.addLine(to: CGPoint(x: 100, y: 300))
        //            path.addLine(to: CGPoint(x: 300, y: 300))
        //            path.addLine(to: CGPoint(x: 200, y: 100))
        //        }
        //        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        
        // Example 3
        //        Triangle()
        //            .fill(.red)
        //            .frame(width: 300, height: 300)
        
        // Example 4
        //        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
        //            .stroke(.blue, lineWidth: 10)
        //            .frame(width: 300, height: 300)
        
        // Example 5
        //        Circle()
        //            .strokeBorder(.blue, lineWidth: 40)
        
        // Example 6
        //        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
        //            .strokeBorder(.blue, lineWidth: 40)
        
        // Example 7
        //        VStack {
        //            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
        //                .stroke(.red, lineWidth: 1)
        //
        //            Text("Offset")
        //            Slider(value: $petalOffset, in: -40...40)
        //                .padding([.horizontal, .bottom])
        //
        //            Text("Witdh")
        //            Slider(value: $petalWidth, in: 0...100)
        //                .padding(.horizontal)
        //        }
        
        // Example 8
        //        VStack {
        //            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
        //                .fill(.red, style: FillStyle(eoFill: true))
        //
        //            Text("Offset")
        //            Slider(value: $petalOffset, in: -40...40)
        //                .padding([.horizontal, .bottom])
        //
        //            Text("Witdh")
        //            Slider(value: $petalWidth, in: 0...100)
        //                .padding(.horizontal)
        //        }
        
        // Example 9
        //        Text("Hello world!")
        //            .frame(width: 300, height: 300)
        //            .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.4, width: 1, height: 0.2), scale: 0.1), width: 50)
        
        // Example 10
        //        Capsule()
        //            .strokeBorder(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.4, width: 1, height: 0.5), scale: 0.3), lineWidth: 20)
        //            .frame(width: 300, height: 200)
        
        // Example 11
        //        VStack {
        //            ColorCyclingCircle(amount: colorCycle)
        //                .frame(width: 300, height: 300)
        //
        //            Slider(value: $colorCycle)
        //        }
        
        // Example 12
        //        ZStack {
        //            Image("Example")
        //
        //            Rectangle()
        //                .fill(.red)
        //                .blendMode(.multiply)
        //        }
        
        // Example 13
        //        ZStack {
        //            Image("Example")
        //                .colorMultiply(.red)
        //        }
        
        // Example 14
        //        VStack {
        //            ZStack {
        //                Circle()
        //                    .fill(Color(red: 1, green: 0, blue: 0))
        //                    .frame(width: 200 * amount)
        //                    .offset(x: -50, y: -80)
        //                    .blendMode(.screen)
        //
        //                Circle()
        //                    .fill(Color(red: 0, green: 1, blue: 0))
        //                    .frame(width: 200 * amount)
        //                    .offset(x: 50, y: -80)
        //                    .blendMode(.screen)
        //
        //                Circle()
        //                    .fill(Color(red: 0, green: 0, blue: 1))
        //                    .frame(width: 200 * amount)
        //                    .blendMode(.screen)
        //            }
        //            .frame(width: 300, height: 300)
        //
        //            Slider(value: $amount)
        //                .padding()
        //        }
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .background(.black)
        //        .ignoresSafeArea()
        //    }
        
        // Example 15
        //        VStack {
        //            Image("Example")
        //                .resizable()
        //                .scaledToFit()
        //                .frame(width: 200, height: 200)
        //                .saturation(amount)
        //                .blur(radius: (1 - amount) * 20)
        //
        //            Slider(value: $amount)
        //                .padding()
        //        }
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //        .background(.black)
        //        .ignoresSafeArea()
        //    }
        
        // Example 16
        //        Trapezoid(insetAmount: insetAmount)
        //            .frame(width: 200, height: 100)
        //            .onTapGesture {
        //                withAnimation {
        //                    insetAmount = Double.random(in: 10...90)
        //                }
        //            }
        
        // Example 17
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    columns = 16
                }
            }
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
