//
//  ContentView.swift
//  Moonshot
//
//  Created by Andre Silva on 21/04/2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var showingGrid = true
    
    
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar() {
                Button {
                    withAnimation {
                        showingGrid.toggle()
                    }
                } label: {
                    if showingGrid {
                        Image(systemName: "square.grid.2x2")
                    } else {
                        Image(systemName: "list.bullet")
                    }
                    
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
