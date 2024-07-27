//
//  EmojiMemoryGameView.swift
//  27_Memorize_cs193p_swiftUI
//
//  Created by Tiago de Freitas Costa on 2024-07-23.
//View

import SwiftUI

struct EmojiMemoryGameView: View { // ContentView behaves like a View
    var viewModel: EmojiMemoryGame
    
    let emojis = ["👻", "🎃", "🕷️", "🕷️", "🕷️", "😈", "👻", "🎃", "🕷️", "🕷️", "🕷️", "😈"]
    @State var cardCount: Int = 4
    
    var body: some View {  //computed property
            ScrollView{
                cards
            }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content:  emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    

    
}


struct CardView: View {
    let content: String // needs to be a let because there is not default
    @State var isFacedUp = true // variable with initial value false
        
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFacedUp ? 1 : 0)
            base.fill().opacity(isFacedUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFacedUp.toggle()
        }
    }
}


#Preview {
    EmojiMemoryGameView()
}