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

struct ContentView: View {
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
        HStack (alignment: .midAcountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAcountAndName) { d in d[VerticalAlignment.center]}
                Image("paul-hudson")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAcountAndName) { d in d[VerticalAlignment.center]}
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
