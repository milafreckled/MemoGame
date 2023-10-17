//
//  CardView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import Foundation
import SwiftUI

struct CardView: View {
    @State private var isFlipped = false
    @State private var color: Color = .blue
    var cardContent: String;
    init(content: String){
        cardContent = content;
    }
    var body: some View {
        Group {
                RoundedRectangle(cornerRadius: 12)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 2))
                    .frame(width: 200, height: 200)
                    .foregroundColor(isFlipped ? .white : .blue)
                    .overlay(
                        
                        isFlipped ? Text("😄") : nil, alignment: .center
                    )
                    .onTapGesture {
                        withAnimation {
                            isFlipped.toggle()
//                            color = color == .blue ? .white : .blue;
                        }
                    }
//                    .opacity(isFlipped ? 0.1 : 1.0)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "😄")
    }
}

