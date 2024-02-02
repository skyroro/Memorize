//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Дарья Пачурина on 27.12.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    //new game
                    viewModel.newGame()
                }, label: {
                    Image(systemName: "repeat")
                        .foregroundColor(viewModel.color)
                        .font(.largeTitle)
                })
                Spacer()
                VStack{
                    Text("Memorize!").font(.largeTitle).foregroundColor(viewModel.color)
                    Text(viewModel.themeName).foregroundColor(viewModel.color)
                }
                Spacer()
                Button(action: {
                    viewModel.shuffle()
                }, label: {
                    Image(systemName: "shuffle")
                        .foregroundColor(viewModel.color)
                        .font(.largeTitle)
                })
            }
            Text("Score \(viewModel.score)")
                .foregroundColor(viewModel.color)
                .frame(width: 350, alignment: .leading)

            
            cards
                .animation(.default, value: viewModel.cards)
            
            
        }
        .padding()
    }
    
    private var cards : some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundColor(viewModel.color)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card){
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1: 0)
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
