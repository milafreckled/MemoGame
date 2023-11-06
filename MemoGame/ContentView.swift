//
//  ContentView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
   
//    private(set) var cards : Array<CardView>
    //    for _ in 0..<cardsArray.count/2{
    
//}
    @ObservedObject var viewModel: MyMemoGame = MyMemoGame();
    private var cardsNumber = 10;
//    var content: (Identifiable) -> View
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Button("WYMIESZAJ"){
                viewModel.shuffle()
            }

        }
        .padding()
    }
    @ViewBuilder
    mutating func adjustCardNumber(by offset: Int, symbol: String) -> some View{
        Button(action: {cardsNumber = cardsNumber + offset}, label: {Image(systemName: symbol)}).font(.largeTitle)
    }
    var cards: some View {
        GeometryReader{ geometry in
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 95), spacing: 0)], spacing: 0){
                ForEach(viewModel.cards){
                    card in CardView(card).aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture(viewModel.choose(card))
                }
    }
                                }.foregroundColor(viewModel.themeColor)
                                }

#Preview {
    ContentView()
}
