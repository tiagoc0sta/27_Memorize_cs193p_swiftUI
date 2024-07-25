//
//  ContentView.swift
//  27_Memorize_cs193p_swiftUI
//
//  Created by Tiago de Freitas Costa on 2024-07-23.
//

import SwiftUI

struct ContentView: View { // ContentView behaves like a View
    let emojis = ["👻", "🎃", "🕷️", "🕷️", "🕷️",  "😈"]

    var body: some View {  //computed property
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content:  emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    let content: String // needs to be a let because there is not default
    @State var isFacedUp = true // variable with initial value false
        
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFacedUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            print("Tapped")
            isFacedUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
