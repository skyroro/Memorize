//
//  Theme.swift
//  Memorize
//
//  Created by Дарья Пачурина on 24.01.2024.
//

import Foundation

struct Theme {
    let name: String
    let emojis: [String]
    let numberOfPairs: Int
    let color: String
}

let themes = [
    Theme(name: "Halloween",
          emojis: ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"],
          numberOfPairs: 12,
          color: "orange"),
    
    Theme(name: "Underwater world",
          emojis: ["🧜‍♀️","🪼","🐳","🐋","🦑","🐠","🐡","🐟","🦈","🐚","🪸"],
          numberOfPairs: 12,
          color: "cyan"),
    
    Theme(name: "Traveling",
          emojis: ["🗽","🏰","🏯","🗿","🏝️","🌋","🏔️","🏕️","🕌","⛩️","🏛️"],
          numberOfPairs: 11,
          color: "blue"),
    
    Theme(name: "Fruits",
          emojis: ["🍎","🍐","🍊","🍋","🍑","🥭","🍍","🥥","🥝", "🍌"],
          numberOfPairs: 9,
          color: "green"),
    
    Theme(name: "Food",
          emojis: ["🥞","🍳","🍔","🍕","🥘","🌮","🥘","🍱","🍝","🍣","🍙","🥗"],
          numberOfPairs: 12,
          color: "yellow"),
    
    Theme(name: "Animals",
          emojis: ["🦊","🐯","🦁","🐷","🐮","🐻","🐱","🐰","🐼","🐨","🐹","🐴"],
          numberOfPairs: 12,
          color: "brown"),
    
    Theme(name: "Magic",
          emojis: ["✨","💎","🔮","🪞","🎎","♠️","🕯️","💰","🔥","🥀"],
          numberOfPairs: 10,
          color: "purple")
]
