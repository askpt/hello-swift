//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Andre Silva on 20/06/2022.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAcountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            
            GeometryReader { geo in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                    }
            }
            .background(.orange)
            
            Text("Right")
        }
    }
}

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        // Example 1
        //        Text("Hello, world!")
        //            .background(.red)
        //            .padding(20)
        
        // Example 2
        //        Text("Live long and prosper!")
        //            .frame(width: 300, height: 300, alignment: .topLeading)
        //            .offset(x: 50, y: 50)
        
        // Example 3
        //        HStack(alignment: .lastTextBaseline) {
        //            Text("Live")
        //                .font(.caption)
        //            Text("long")
        //            Text("and")
        //                .font(.title)
        //            Text("prosper")
        //                .font(.largeTitle)
        //        }
        
        // Example 4
        //        VStack(alignment: .leading) {
        //            Text("Hello world")
        //                .alignmentGuide(.leading) { d in
        //                    d[.trailing]
        //                }
        //            Text("This is a longer text")
        //        }
        //        .background(.red)
        //        .frame(width: 400, height: 400)
        //        .background(.blue)
        
        // Example 5
        //        VStack(alignment: .leading) {
        //            ForEach(0..<10){ position in
        //                Text("Number \(position)")
        //                    .alignmentGuide(.leading) { _ in
        //                        Double(position) * -10
        //                    }
        //            }
        //        }
        //        .background(.red)
        //        .frame(width: 400, height: 400)
        //        .background(.blue)
        
        // Example 6
        //        HStack (alignment: .midAcountAndName) {
        //            VStack {
        //                Text("@twostraws")
        //                    .alignmentGuide(.midAcountAndName) { d in d[VerticalAlignment.center]}
        //                Image("paul-hudson")
        //                    .resizable()
        //                    .frame(width: 64, height: 64)
        //            }
        //
        //            VStack {
        //                Text("Full name:")
        //                Text("PAUL HUDSON")
        //                    .alignmentGuide(.midAcountAndName) { d in d[VerticalAlignment.center]}
        //                    .font(.largeTitle)
        //            }
        //        }
        
        // Example 7
        //        Text("Hello world!")
        //            .background(.red)
        //            .position(x: 100, y: 100)
        //            .background(.blue)
        
        // Example 8
        //        Text("Hello world!")
        //            .offset(x: 100, y: 100)
        //            .background(.blue)
        
        // Example 9
        //        VStack {
        //            GeometryReader { geo in
        //                Text("Hello, world!")
        //                    .frame(width: geo.size.width * 0.9)
        //                    .background(.red)
        //            }
        //            .background(.green)
        //
        //            Text("More Text")
        //            Text("More Text")
        //            Text("More Text")
        //                .background(.blue)
        //        }
        
        // Example 10
        //        OuterView()
        //            .background(.red)
        //            .coordinateSpace(name: "Custom")
        
        // Example 11
//        GeometryReader { fullView in
//            ScrollView {
//                ForEach(0..<50) { index in
//                    GeometryReader { geo in
//                        Text("Row #\(index)")
//                            .font(.title)
//                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
//                            .rotation3DEffect(.degrees(geo.frame(in: .global).midY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
//                    }
//                    .frame(height: 40)
//                }
//            }
//        }
        
        // Example 12
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 0) {
//                ForEach(1..<20) { num in
//                    GeometryReader { geo in
//                        Text("Number \(num)")
//                            .font(.largeTitle)
//                            .padding()
//                            .background(.red)
//                            .rotation3DEffect(.degrees(-geo.frame(in: .global).midX) / 8, axis: (x: 8, y: 1, z: 0))
//                            .frame(width: 200, height: 200)
//                    }
//                    .frame(width: 200, height: 200)
//
//                }
//            }
//        }
        
        // Challenge
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
//                            .frame(maxWidth: .infinity)
                            .frame(maxWidth: abs(geo.frame(in: .global).origin.y / 2) > 125 ? abs(geo.frame(in: .global).origin.y / 2) : 125)
//                            .background(colors[index % 7])
                            .background(Color(hue: geo.frame(in: .global).origin.y / 1000, saturation: 1, brightness: 1))
                            .opacity(abs(geo.frame(in: .global).origin.y) < 200 ? (abs(geo.frame(in: .global).origin.y) / 200.0) : 1)
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
