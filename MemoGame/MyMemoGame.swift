//
//  MemoGame.swift
//  MemoGame
//
//  Created by Людмила Маломуж on 04/11/2023.
//

import Foundation

class MyMemoGame: ObservableObject{
    @Published private var model: MemoGame<String>
    var theme: Theme;
    init(theme: Theme){
        self.theme = theme
        model = MyMemoGame.createMemoGame(theme: theme)
    }
    private static func createMemoGame(theme: Theme) -> MemoGame<String>{
        return MemoGame<String>(
            numberPairsOfCard: theme.emojis.count){  pairIndex in
                    return theme.emojis[pairIndex]
            }
    }
    func changeTheme(theme: Theme){
        model = MyMemoGame.createMemoGame(theme: theme)
    }
    var cards: Array<MemoGame<String>.Card>{
        model.cards
    }
    func shuffle(){
        model.shuffle();
//        typealias Card = MemoGame<String>.Card
//        var shuffledCards: Array<Card>
//
//        let shuffledIndices = Array(0..<theme.emojis.count*2).shuffled()
//        for index in shuffledIndices.prefix(8) {
//            shuffledCards.append(Card(content: theme.emojis[index], id: String(index)))
//        }
//
//        model.cards = shuffledCards.shuffled().map { CardView($0) }
    }
    func choose(card: MemoGame<String>.Card){
        model.choose(card: card)
    }
    func resetGame(){
        model = MyMemoGame.createMemoGame(theme: theme)
    }
}
