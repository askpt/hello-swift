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

struct ExamplesView: View {
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
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(.blue, lineWidth: 40)
    }
}

struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplesView()
    }
}
