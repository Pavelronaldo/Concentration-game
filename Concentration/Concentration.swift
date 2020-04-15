//
//  Concentration.swift
//  Concentration
//
//  Created by Pavel Ronaldo on 4/12/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import Foundation

struct Concentration
{
    private(set) var cards = [Card]()
    
    private  var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            let ch = "hello".oneAndOnly
            return cards.indices.filter {cards[$0].isFaceUp}.oneAndOnly
            //            var foundIndex: Int?
            //            for index in cards.indices {
            //                if cards[index].isFaceUp{
            //                    if foundIndex == nil {
            //                        foundIndex = index
            //                    }else{
            //                        return nil
            //                    }
            //
            //                }
            //            }
            //            return foundIndex
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration. ChosenCard(at: \(index)):chosen index not in the cards")
        if !cards [index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // either no cards or 2 cards
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(index)):you must ahve at least one pair of cards")
        for _ in 0...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first: nil
    }
}
