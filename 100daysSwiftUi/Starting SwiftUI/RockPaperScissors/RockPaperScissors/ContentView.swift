//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Andre Silva on 07/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State var aiPick: Int = Int.random(in: 0...2)
    @State var aiShouldWin: Bool = Bool.random()
    
    @State var score: Int = 0
    @State var numberPlays: Int = 0
    
    @State var showingGameOver: Bool = false
    
    let options = ["Rock", "Paper", "Scissors"]
    let winOptions = ["Paper", "Scissors", "Rock"]
    let loseOptions = ["Scissors", "Rock", "Paper"]
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text("Current score: \(score)")
            Text(aiShouldWin ? "User needs to win" : "User needs to lose")
            Text("App picked: \(options[aiPick])")
            
            Spacer()
            
            ForEach(0..<options.count, id: \.self) { index in
                Button {
                    tappedOption(index)
                } label: {
                    Text(options[index])
                        .padding()
                        .foregroundColor(.white)
                        .background(.gray)
                }
            }
            Spacer()
            Spacer()
        }
        .padding()
        .alert("Game is over", isPresented: $showingGameOver) {
            Button("Restart", action: reset)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func tappedOption(_ userPicked: Int) {
        let rightAnswer = aiShouldWin ? winOptions[aiPick] : loseOptions[aiPick]
        let selectedAnswer = options[userPicked]
        
        if rightAnswer == selectedAnswer {
            score += 1
        } else {
            score -= 1
        }
        
        numberPlays += 1
        aiPick = Int.random(in: 0...2)
        aiShouldWin = Bool.random()
        
        if (numberPlays >= 10) {
            showingGameOver = true
        }
    }
    
    func reset() {
        score = 0
        numberPlays = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
