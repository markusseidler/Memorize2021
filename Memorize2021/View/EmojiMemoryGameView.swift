//
//  ContentView.swift
//  Memorize2021
//
//  Created by Markus Seidler on 8/1/21.
//

import SwiftUI
 
struct EmojiMemoryGameView: View {
    @StateObject var viewModel: EmojiMemoryGame
    var themeColor: Color
    var themeName: String
    
    @State private var score: Int = 0

    var body: some View {
         
        VStack {
            Text("Score: \(score)")
            Grid(viewModel.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }
                        .padding(5)
                }
            
        }
        .padding()
        .foregroundColor(themeColor)
        navigationBarTitle(themeName, displayMode: .inline)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill()
                }
                
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3.0
    private let fontScaleFactor: CGFloat = 0.75
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame(gameTheme: EmojiThemes().all.first!), themeColor: Color.red, themeName: "Test Screen")
    }
}
