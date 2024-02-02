//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Дарья Пачурина on 11.01.2024.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject { //модель вида
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: theme.emojis.count) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
            } else {
                return "?"
            }
        }
    }
    
    @Published private var model: MemoryGame<String>
    private var theme: Theme
    
    init() {
        self.theme = themes.randomElement()!
        self.model = EmojiMemoryGame.createMemoryGame(theme: theme)
        self.model.shuffle()
    }
    
    var dictionaryOfColors = [
        "orange": Color.orange,
        "blue": Color.blue,
        "green": Color.green,
        "purple": Color.indigo,
        "yellow": Color.yellow,
        "cyan": Color.cyan,
        "brown": Color.brown
        
    ]

    var themeName: String{
        return theme.name
    }
    
    var color: Color {
        return dictionaryOfColors[theme.color]!
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    //MARK: - Intents
    
    
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        let newTheme = themes.randomElement()!
        self.theme = newTheme
        self.model = EmojiMemoryGame.createMemoryGame(theme: newTheme)
        self.model.shuffle()
    }
}
