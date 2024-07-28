//
//  EmojiMemoryGame.swift
//  27_Memorize_cs193p_swiftUI
//
//  Created by Tiago de Freitas Costa on 2024-07-26.
//ViewModel

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "🕷️", "🕷️", "😈", "👻", "🎃", "🕷️", "🕷️", "🕷️", "😈"] //static var to make initialize first
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { pairIndex  in    //closure
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
 
        
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
        
    // MARK: - Intents
        
    func shuffle() {
        model.shuffle()
        
    }
    
        
        func choose(_ card: MemoryGame<String>.Card) {
            model.choose(card)
        }
    
}
