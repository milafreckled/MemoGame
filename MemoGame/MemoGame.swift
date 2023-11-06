//
//  MemoGame.swift
//  MemoGame
//
//  Created by Людмила Маломуж on 04/11/2023.
//

import Foundation

struct MemoGame<CardContent>{
    private(set) var cards: Array<Card>
    
    init(numberPairsOfCard: Int, cardContentFactory: (Int) -> CardContent){
        for pairIndex in 0..<max(2, numberPairsOfCard){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
