//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Dovila Longmis on 22/04/2025.
//

import SwiftUI

struct ContentView: View {
    
    let options = ["✊ Rock", "✋ Paper", "✌️ Scissors"]
    let emojis = ["✊", "✋", "✌️"]
    
    @State private var playerChoice: String = ""
    @State private var computerChoice: String = ""
    @State private var result: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Rock, Paper, Scissors")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("👩 You chose: \(playerChoice)")
                Text("🤖 Computer: \(computerChoice)")
                Text("🎉 \(result)")
                    .font(.headline)
                    .foregroundColor(.yellow)
                
                HStack(spacing: 20) {
                    ForEach(emojis.indices, id: \.self) { index in
                        Button(action: {
                            playGame(playerMove: options[index])
                        }) {
                            Text(emojis[index])
                                .font(.system(size: 50))
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .foregroundColor(.white)
            .padding()
        }
    }
    
    func playGame(playerMove: String) {
        playerChoice = playerMove
        let randomIndex = Int.random(in: 0..<options.count)
        computerChoice = options[randomIndex]
        
        let resultMatrix: [String: [String: String]] = [
            "✊ Rock": ["✊ Rock": "Draw", "✋ Paper": "You Lose", "✌️ Scissors": "You Win"],
            "✋ Paper": ["✊ Rock": "You Win", "✋ Paper": "Draw", "✌️ Scissors": "You Lose"],
            "✌️ Scissors": ["✊ Rock": "You Lose", "✋ Paper": "You Win", "✌️ Scissors": "Draw"]
        ]
        
        result = resultMatrix[playerMove]?[computerChoice] ?? "Error"
    }
}
