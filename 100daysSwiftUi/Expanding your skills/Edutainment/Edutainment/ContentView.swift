//
//  ContentView.swift
//  Edutainment
//
//  Created by Andre Silva on 17/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State var multiplicationTable = 2
    @State var nrQuestions = 5
    @State var isGameActive = false
    @State var questions : Array<Question> = []
    @State var score = 0
    @State var currentQuestion = 0
    @State var userAnswer = 0
    @State var isGameComplete = false
    @State var gameCompleteMessage = ""
    
    @FocusState var userAnswerIsFocused: Bool
    
    let questionsAvailable = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            VStack {
                if isGameActive {
                    Text("User Score: \(score)")
                    Form {
                        Section() {
                            Text("\(questions[currentQuestion].data)")
                        }
                        Section("Enter your answer") {
                            TextField(" ", value: $userAnswer, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($userAnswerIsFocused)
                        }
                        Section {
                            Button("Enter") {
                                withAnimation {
                                    checkAnswer()
                                }
                            }
                        }
                    }
                    .alert("Game completed", isPresented: $isGameComplete) {
                        Text("\(gameCompleteMessage)")
                        Button("Restart", role: .cancel, action: restart)
                    }
                } else {
                    Form {
                        Section ("Up to...") {
                            Stepper("\(multiplicationTable)", value: $multiplicationTable, in: 2...12)
                        }
                        Section ("How many questions?") {
                            Picker("", selection: $nrQuestions) {
                                ForEach(questionsAvailable, id: \.self) { question in
                                    Text("\(question)")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Section {
                            Button("Start Game") {
                                withAnimation {
                                    generateGame()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Edutainment")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        userAnswerIsFocused = false
                    }
                }
            }
        }
    }
    
    func generateGame() {
        questions.removeAll()
        for question in 1...nrQuestions {
            let multiplication = Int.random(in: 2...multiplicationTable)
            
            let question = Question(data: "\(multiplication) X \(question)", answer: multiplication * question)
            questions.append(question)
        }
        
        isGameActive = true
    }
    
    func checkAnswer() {
        let answer = questions[currentQuestion].answer
        
        if userAnswer == answer {
            score += 1
        }
        
        userAnswer = 0
        if currentQuestion < nrQuestions - 1 {
            currentQuestion += 1
        } else {
            gameCompleteMessage = "Your score is \(score)"
            isGameComplete = true
        }
    }
    
    func restart() {
        isGameActive = false
        userAnswer = 0
        score = 0
        gameCompleteMessage = ""
        currentQuestion = 0
    }
}

struct Question {
    var data: String
    var answer: Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
