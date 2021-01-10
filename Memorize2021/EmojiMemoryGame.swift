//
//  EmojiMemoryGame.swift
//  Memorize2021
//
//  Created by Markus Seidler on 10/1/21.
//

import SwiftUI

class EmojiMemoryGame {
    // only inside this class, the model var can be modified but outside, it can be still seen. e.g.: by views
//    private(set) var model: MemoryGame<String>
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // alternative make it full private and create a public var -> access to the model
    private var model: MemoryGame<String> = createMemoryGame()
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    // otherwise: "Cannot use instance member 'createMemoryGame' within property initializer; property initializers run before 'self' is available"... functions cannot be used until all variables are initialized -> solution -> use static function (vars on the type)
    
     static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
        
    }
}

