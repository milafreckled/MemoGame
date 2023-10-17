//
//  ContentView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    var cardsArray = ["😀", "🐸", "🐹", "😛"]
//    private(set) var cards : Array<CardView>
    //    for _ in 0..<cardsArray.count/2{
    
//}
    @State var cardsNumber = 10;
    mutating func adjustCardNumber(by offset: Int, symbol: String) -> some View{
        return Button(action: {cardsNumber += offset}, label: {Image(systemName: symbol)}).font(.largeTitle)
    }
    var body: some View {
        VStack {
            CardView(content: "😄");
            Button(role: .destructive) {
                <#code#>
            } label: {
                "+"
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
