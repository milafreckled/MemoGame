//
//  Cardify.swift
//  MemoGame
//
//  Created by Людмила Маломуж on 11/12/2023.
//

import Foundation
import SwiftUI

struct Cardify: AnimatableModifier { // == (ViewModifier, Animatable)
//    var rotation: Double
    var color: Color
    var isFaceUp: Bool
    init(isFaceUp: Bool, color: Color) {
        self.isFaceUp = isFaceUp
        self.color = color
    }
    
//    var isFaceUp: Bool {
//        rotation < 90
//    }
//    
//    var animatableData: Double {
//        get { return rotation }
//        set { rotation = newValue }
//    }
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: CORNER_RADIUS)
            Group {
                base.fill(color)
                base.stroke(color, lineWidth: 3)
                content
            }.opacity(isFaceUp ? 1.0 : 0.0)
            base.opacity(isFaceUp ? 0.0 : 1.0)
        }
        .rotation3DEffect(Angle.degrees(360), axis: (0,1,0)) // around Z-axis
    }
    private let CORNER_RADIUS: CGFloat = 12.0
    private let EDGE_LINE_WIDTH: CGFloat = 3.0
}

extension View {
    func cardify(isFaceUp: Bool, color: Color) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp, color: color))
    }
}
