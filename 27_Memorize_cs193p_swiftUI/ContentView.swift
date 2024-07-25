//
//  ContentView.swift
//  27_Memorize_cs193p_swiftUI
//
//  Created by Tiago de Freitas Costa on 2024-07-23.
//

import SwiftUI

struct ContentView: View { // ContentView behaves like a View
    let emojis = ["👻", "🎃", "🕷️", "🕷️", "🕷️", "😈", "👻", "🎃", "🕷️", "🕷️", "🕷️", "😈"]
    @State var cardCount: Int = 4
    
    var body: some View {  //computed property
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAjusters
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content:  emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
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
    ContentView()
}
