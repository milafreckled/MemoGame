//
//  CardView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import Foundation
import SwiftUI

struct CardView: View{
    var card: MemoGame<String>.Card
//        var body: some View{
//            GeometryReader{ geometry in
//                body(for: geometry.size)}
//        }
//        @ViewBuilder
    var body: some View {
        ZStack {
            let base =  RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(card.color)
                base.strokeBorder(card.color, lineWidth: 3)
                base.frame(minHeight: 160)
                Text(card.content)
                    .font(.largeTitle)
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360:0))
                    .animation(card.isMatched ? .linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill(card.color).opacity(card.isFaceUp ? 0 : 1)
            }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView_old(content: "😄")
//    }
//}

