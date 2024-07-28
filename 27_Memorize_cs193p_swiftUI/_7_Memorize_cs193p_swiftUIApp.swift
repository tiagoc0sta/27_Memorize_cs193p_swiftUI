//
//  _7_Memorize_cs193p_swiftUIApp.swift
//  27_Memorize_cs193p_swiftUI
//
//  Created by Tiago de Freitas Costa on 2024-07-23.
//

import SwiftUI

@main
struct _7_Memorize_cs193p_swiftUIApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
