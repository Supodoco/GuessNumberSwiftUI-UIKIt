//
//  SliderManager.swift
//  GuessNumberSwiftUI+UIKIt
//
//  Created by Supodoco on 20.12.2022.
//

import Foundation

final class GameManager: ObservableObject {
    
    @Published var targetValue = Int.random(in: 0...100)
    @Published var thumbAlpha = 0.5
    @Published var currentValue = 50.0
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }

    func guessNewNumber() {
        targetValue = Int.random(in: 0...100)
    }
 
    func computeThumbValue() {
        thumbAlpha = Double(computeScore()) / 100
    }
    
    func restartGame() {
        currentValue = 50
        guessNewNumber()
        computeThumbValue()
    }
    
}
