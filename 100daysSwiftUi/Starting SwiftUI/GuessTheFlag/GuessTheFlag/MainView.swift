//
//  OverView.swift
//  GuessTheFlag
//
//  Created by Andre Silva on 02/04/2022.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct MainView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var showingGameover = false
    
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State var score = 0
    @State var attempts = 0
    
    @State var animationAmount = 0.0
    @State var tappedFlag = ""
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 30) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number, flag: countries[number])
                            withAnimation(.interpolatingSpring(stiffness: 10, damping: 100)) {
                                animationAmount += 360
                                tappedFlag = countries[number]
                            }
                        } label: {
                            FlagImage(country: countries[number])
                        }
                        .opacity((countries[number] == tappedFlag) ? 1 : ("" == tappedFlag) ? 1 : 0.25)
                        .scaleEffect((countries[number] == tappedFlag) ? 1 : ("" == tappedFlag) ? 1 : 0.25)
                        .animation(.default, value: tappedFlag)
                        .rotation3DEffect(.degrees((countries[number] == tappedFlag) ? animationAmount : 0.0), axis: (x: 0, y: 1, z: 0))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }.padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game is over", isPresented: $showingGameover) {
            Button("Restart", action: reset)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int, flag flagTapped: String) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(flagTapped)"
            score -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 1...2)
        attempts += 1
        tappedFlag = ""
        
        if (attempts >= 8) {
            showingGameover = true
        }
    }
    
    func reset() {
        attempts = 0
        score = 0
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
