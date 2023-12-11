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
//    @ViewBuilder
    var body: some View {
        ZStack {
            Group{
                CirclePart(startAngle: Angle(degrees: 90), endAngle: Angle(degrees:240)).overlay(
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .rotationEffect(Angle.degrees(card.isMatched ? 360:0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                )
                .modifier(Cardify(isFaceUp: card.isFaceUp, color: card.color))
            }
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        }
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView_old(content: "😄")
//    }
//}

