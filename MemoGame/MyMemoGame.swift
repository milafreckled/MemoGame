//
//  MemoGame.swift
//  MemoGame
//
//  Created by Людмила Маломуж on 04/11/2023.
//

import Foundation

class MyMemoGame{
    private static let emojis = ["😈", "👻", "😀", "🐸", "🐹", "😛"];
    private static func createMemoGame() -> MemoGame<String>{
        return MemoGame<String>(
            numberPairsOfCard: 12){
                index in
                if emojis.indices.contains(index){
                    return emojis[index]
                }else{
                    return "?!"
                }
            }
    }
    private var model = createMemoGame()
    var cards: Array<MemoGame<String>.Card>{
        return model.cards
    }
    func shuffle(){
        model.shuffle();
    }
    func choose(card: MemoGame<String>.Card){
        model.choose(card: card)
    }
}
