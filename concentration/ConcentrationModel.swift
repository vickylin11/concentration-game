//
//  ConcentrationModel.swift
//  concentration
//
//  Created by Sonder2ULVCF on 28/11/19.
//  Copyright © 2019 vicky. All rights reserved.
//

import Foundation

class ConcentrationModel {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int) {

        if !cards[index].isMatched {
            // one card is faced up : check if match
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            } else {
                // no cards or 2 cards are faced up
                for flipDownCardIndex in cards.indices {
                    cards[flipDownCardIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards = cards.shuffled()
    }
}
