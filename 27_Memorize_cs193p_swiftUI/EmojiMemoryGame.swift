//
//  EmojiMemoryGame.swift
//  27_Memorize_cs193p_swiftUI
//
//  Created by Tiago de Freitas Costa on 2024-07-26.
//ViewModel

import SwiftUI


class EmojiMemoryGame {
    private static let emojis = ["👻", "🎃", "🕷️", "🕷️", "🕷️", "😈", "👻", "🎃", "🕷️", "🕷️", "🕷️", "😈"] //static var to make initialize first
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex  in    //closure
            return emojis[pairIndex]
        }
    }

    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
