//
//  MemoryGame.swift
//  Memorize2021
//
//  Created by Markus Seidler on 10/1/21.
//

import Foundation

struct MemoryGame<CardContent> {
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    mutating func choose(card: Card) {
        // need to change it in place!!! Because it is a struct. Cannot change an assigned variable of it as it would change the copy but not the original value.
        // see CS193P Spring 2020 Lecture 3, 10 mins onwards
        
        print("Card chosen: \(card)")
        
        let chosenIndex: Int = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    private func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        
        return 0 // TODO: - add nil
    }
    
   
}
