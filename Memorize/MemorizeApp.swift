//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Дарья Пачурина on 27.12.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
