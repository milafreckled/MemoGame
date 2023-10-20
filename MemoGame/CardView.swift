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
                .frame(width: 150, height: 150)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 2))
                .foregroundColor(isFlipped ? Color.white : Color.blue)
                .onTapGesture {
                    withAnimation {
                        isFlipped.toggle()
                    }
                }
                .overlay(
                    Text(isFlipped ? cardContent :  "")
                        .font(.largeTitle)
                        .foregroundColor(isFlipped ? Color.blue : Color.white)
                )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "😄")
    }
}

