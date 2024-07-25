//
//  ContentView.swift
//  27_Memorize_cs193p_swiftUI
//
//  Created by Tiago de Freitas Costa on 2024-07-23.
//

import SwiftUI

struct ContentView: View { // ContentView behaves like a View
    var body: some View {  //computed property
        HStack {
            CardView(isFacedUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    var isFacedUp: Bool = false
    var body: some View {
        ZStack {
            if isFacedUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        }
    }
}


#Preview {
    ContentView()
}
