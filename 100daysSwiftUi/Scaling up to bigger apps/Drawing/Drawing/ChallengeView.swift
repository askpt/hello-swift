//
//  ChallengeView.swift
//  Drawing
//
//  Created by Andre Silva on 28/04/2022.
//

import SwiftUI

struct Arrow : Shape {
    func path(in rect: CGRect) -> Path {
        let barDistance = rect.maxY / 10
        
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.midY - barDistance))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY - barDistance))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY + barDistance))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY + barDistance))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY - barDistance))
        path.closeSubpath()
        
        return path
    }
}

struct ChallengeView: View {
    @State private var lineWidth : CGFloat = 2
    
    var body: some View {
        Arrow()
            .stroke(.blue, lineWidth: lineWidth)
            .frame(width: 200, height: 200)
        
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
