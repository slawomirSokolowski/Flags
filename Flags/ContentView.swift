//
//  ContentView.swift
//  Flags
//
//  Created by Slawek on 26/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter = 0
    @State private var score = 1
    
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    
    @State private var correctAnswear = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack (spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswear])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                    
                    Text("Your  score is now \(score)")
                        .foregroundColor(.white)
                    
                }
                
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .shadow( radius: 5)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("your score is \(score)")
        }
    }
   
        func flagTapped(_ number: Int) {
            if number == correctAnswear {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong"
                score -= 2
            }
            showingScore = true

        }
        
        func askQuestion() {
            countries.shuffle()
            correctAnswear = Int.random(in: 0...2)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
