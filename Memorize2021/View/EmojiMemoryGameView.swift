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
    
    var score: Int {
        viewModel.score
    }

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
            Button(action: {
                viewModel.resetGame()
            }, label: {
                Text("New Game")
            })
            
        }
        .padding()
        .foregroundColor(themeColor)
        .navigationBarTitle(themeName, displayMode: .inline)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    // @ViewBuilder or alternatively, if could wrap the if statement and its view in a Group {}
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
        ZStack {
            Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(20), clockwise: true)
                .padding(5)
                .opacity(0.4)
            Text(card.content)
                .font(Font.system(size: fontSize(for: size)))
                .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
        }
//        .modifier(Cardiy(isFaceUp: card.isFaceUp))
        .cardify(isFaceUp: card.isFaceUp)
        }
        
    }
    
    // MARK: - Drawing Constant
    private let fontScaleFactor: CGFloat = 0.75
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct ContentView_Previews: PreviewProvider {
  
    
    static var previews: some View {
        let gameTheme = EmojiThemes.exampleTheme
        let viewModel = EmojiMemoryGame(gameTheme: gameTheme)
        let themeColor = Color.red
        let themeName = "Test Screen"
        viewModel.choose(card: viewModel.cards[0])

        return GroupPreview {
            EmojiMemoryGameView(viewModel: viewModel, themeColor: themeColor, themeName: themeName)
        }
//        EmojiMemoryGameView(viewModel: viewModel, themeColor: themeColor, themeName: themeName)
    }
}
