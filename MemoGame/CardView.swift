//
//  CardView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import Foundation
import SwiftUI

struct CardView_old: View {
    var card: MemoGame<String>.Card
    
    init(_ card: MemoGame<String>.Card){
        self.card = card
    }
 
    var body: some View {
        ZStack {
            let base =  RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                }
            .opacity(card.isFaceUp ? 1 : 0)
                base.fill().opacity(card.isFaceUp ? 0 : 1)
            }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView_old(content: "😄")
//    }
//}

