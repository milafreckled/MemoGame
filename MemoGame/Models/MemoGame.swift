//
//  MemoGame.swift
//  MemoGame
//
//  Created by Людмила Маломуж on 04/11/2023.
//

import Foundation

struct MemoGame<CardContent>  where CardContent: Equatable{
    private(set) var cards: Array<Card>
    
    init(numberPairsOfCard: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<max(2, numberPairsOfCard){
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: String(pairIndex*2)))
            cards.append(Card(content: content, id: String(pairIndex*2 + 1)))
        }
        cards.shuffle()
    }
    
    private var indexOfTheFlippedCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.first }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    static func == (lhs: MemoGame<CardContent>, rhs: MemoGame<CardContent>) -> Bool {
        return lhs.cards == rhs.cards
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    mutating func choose(card: Card){
        if let chosenIndex = cards.firstIndex(where: { card == $0 }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchedIndex = indexOfTheFlippedCard{
                if cards[chosenIndex].content == cards[potentialMatchedIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchedIndex].isMatched = true
                    // changeScore
                }
                cards[chosenIndex].isFaceUp = true
            }else{
                indexOfTheFlippedCard = chosenIndex
//                cards[chosenIndex].isFaceUp = false
            }
        }
    }
    
    struct Card: Identifiable, Equatable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: String
    }
}
