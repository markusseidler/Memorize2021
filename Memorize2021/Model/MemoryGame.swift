//
//  MemoryGame.swift
//  Memorize2021
//
//  Created by Markus Seidler on 10/1/21.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var wasSeen: Bool = false
        var content: CardContent
        var id: Int
    }
    
    private (set) var score: Int
    private (set) var cards: Array<Card>
    private var hasTwoFaceUpCards: Bool {
        cards.filter { $0.isFaceUp }.count == 2
    }
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
//            var faceUpCardIndices = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardIndices.append(index)
//                }
//            }
//
//            if faceUpCardIndices.count == 1 {
//                return faceUpCardIndices.first
//            } else {
//                return nil
//            }
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
//            for index in cards.indices {
//                if index == newValue {
//                    cards[index].isFaceUp = true
//                } else {
//                    cards[index].isFaceUp = false
//                }
//            }
        }
    }
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
        score = 0
    }
    
    mutating private func increaseScore(by points: Int) {
        score += points
    }
    
    mutating private func decreaseScore(by points: Int) {
        score += points
    }
    
    mutating func choose(card: Card, addPoints: Int, deductPoints: Int) {
        // need to change it in place!!! Because it is a struct. Cannot change an assigned variable of it as it would change the copy but not the original value.
        // see CS193P Spring 2020 Lecture 3, 10 mins onwards
 
        if let chosenIndex  = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            // card is not FaceUp yet and not matched and can be found in the array
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // there is only one faceUp card now 
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    // newCard matches FaceUp card
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].wasSeen = false
                    cards[potentialMatchIndex].wasSeen = false
                    increaseScore(by: addPoints)
                    
                    // change both cards to matched
                }
                cards[chosenIndex].isFaceUp = true
                
                if hasTwoFaceUpCards {
                    if cards[chosenIndex].wasSeen {
                        decreaseScore(by: deductPoints)
                    }
                    
                    if cards[potentialMatchIndex].wasSeen {
                        decreaseScore(by: deductPoints)
                    }
                    
                    cards[chosenIndex].wasSeen = true
                    cards[potentialMatchIndex].wasSeen = true
                }
                // newCard is FaceUp, result two cards are faceUp
            } else {
                // ther is no FaceUp card yet or two faceUp card
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                // newCard is now FaceUp card
            }
        }
    }
}
