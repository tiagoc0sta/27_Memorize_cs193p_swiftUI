//
//  MemorizeGame.swift
//  27_Memorize_cs193p_swiftUI
//
//  Created by Tiago de Freitas Costa on 2024-07-26.
//Model

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>  //access control - private set
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    
    struct Card {
        var isFaceup = false
        var isMarched  = false
        let content: CardContent
    }
    
}
