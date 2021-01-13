//
//  EmojiMemoryGame.swift
//  Memorize2021
//
//  Created by Markus Seidler on 10/1/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // only inside this class, the model var can be modified but outside, it can be still seen. e.g.: by views
//    private(set) var model: MemoryGame<String>
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model!.cards
    }
    
   var score: Int {
        model!.score
    }
    
    init(gameTheme: Theme) {
        self.gameTheme = gameTheme
        self.model = MemoryGame(numberOfPairOfCards: Int.random(in: 2...gameTheme.icons.count), cardContentFactory: { (pairIndex) in
            self.gameTheme.icons.map { String($0) }[pairIndex]
        })
    }
    
    // alternative make it full private and create a public var -> access to the model
    // adding @Published. Every time this property (here private var model) changes, this class informs any object (-> StateObject) that is listening. Because of that, we don't need to state objectWillChange.send() every time we want to inform listening objects (-> StateObject). Please note that those Publishers just announce that something has changed. They will not inform what has changed. CS193P Spring 2020, Lecture 3, 25min
//    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model!.choose(card: card, addPoints: 2, deductPoints: 1)
    }
    
    func resetGame() {
        model = MemoryGame(numberOfPairOfCards: Int.random(in: 2...gameTheme.icons.count), cardContentFactory: { (pairIndex) in
            self.gameTheme.icons.map { String($0) }[pairIndex]})
    }
    

    // MARK: - Private API to start the game
    private var gameTheme: Theme
    @Published private var model: MemoryGame<String>?
    
    
    
    // otherwise: "Cannot use instance member 'createMemoryGame' within property initializer; property initializers run before 'self' is available"... functions cannot be used until all variables are initialized -> solution -> use static function (vars on the type)
    
//     private static func createMemoryGame() -> MemoryGame<String> {
//        let emojis = ["👻", "🎃", "🕷"]
//        return MemoryGame<String>(numberOfPairOfCards: emojis.count) { pairIndex in
//            emojis[pairIndex]
//        }
//
//    }
}

