//
//  ContentView.swift
//  GuessNumberSwiftUI+UIKIt
//
//  Created by Supodoco on 19.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameManager = GameManager()
    
    @State private var checkNumberIsPresented = false
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Подвиньте слайдер, как можно ближе к: \(gameManager.targetValue)")
            HStack {
                Text("0")
                SliderUIKit(
                    thumbAlpha: $gameManager.thumbAlpha,
                    currentValue: $gameManager.currentValue
                )
                .onChange(of: gameManager.currentValue) { newValue in
                    gameManager.computeThumbValue()
                }
                Text("100")
            }
            Button("Проверь меня!") {
                checkNumberIsPresented.toggle()
            }
            Button("Начать заново") {
                gameManager.restartGame()
            }
        }
        .padding()
        .alert(isPresented: $checkNumberIsPresented) {
            Alert(
                title: Text("Your Score"),
                message: Text(gameManager.computeScore().formatted())
            )
        }
        .onAppear {
            gameManager.computeThumbValue()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
