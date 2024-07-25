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
    @State var isFacedUp = false // variable with initial value false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFacedUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻")
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
