//
//  ContentView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MyMemoGame
    @State private var currentTheme: Theme = DefaultThemes.redTheme
    var changeTheme : some View{
        HStack{
            ThemeButton(theme: DefaultThemes.redTheme, action: { currentTheme = DefaultThemes.redTheme})
            ThemeButton(theme: DefaultThemes.greenTheme, action: { currentTheme = DefaultThemes.greenTheme})
            ThemeButton(theme: DefaultThemes.blueTheme, action: { currentTheme = DefaultThemes.blueTheme})
        }
    }
//    var ThemeButton: ((String, Color, [String], @escaping () -> Void) -> Button<VStack<TupleView<(some View, Text)>>>) =  {name, color, emojis, action in
//        Button(action: action){
//                    VStack {
//                        Image(systemName: "pencil")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 30, height: 30)
//                            
//                        Text(name)
//                            .font(.caption)
//                            .foregroundColor(color)
//                    }
//                }
//        
//    }
    var body: some View {

//                        .navigationBarItems()
        VStack {
            Text("Memo")
                .navigationBarTitleDisplayMode(.inline)
                .font(.largeTitle)
                .padding()
            ScrollView{
                LazyVGrid(columns: [GridItem(.fixed(120)), GridItem(.fixed(120))], spacing: 200){
                    ForEach(viewModel.cards){card in
                        CardView(card: card, theme: currentTheme).onTapGesture{
                            withAnimation(.easeInOut(duration: 0.5)){
                                viewModel.choose(card: card)
                            }
                        }
                        //                        viewModel.cards.firstIndex(of: card) % 2 == 1 &&
                        //                            Spacer()
                        
                    }
                }.padding()
            }
        }
        Spacer()
        changeTheme
    }
//    @ViewBuilder
//    mutating func adjustCardNumber(by offset: Int, symbol: String) -> some View{
//        Button(action: {cardsNumber = cardsNumber + offset}, label: {Image(systemName: symbol)}).font(.largeTitle)
//    }
   
}

struct CardView: View{
    var card: MemoGame<String>.Card
    var body: some View{
        GeometryReader{ geometry in
            body(for: geometry.size)}
    }
    var theme: Theme
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        ZStack {
            let base =  RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(theme.color)
                base.strokeBorder(lineWidth: 3)
                base.frame(minHeight: 200)
                Text(card.content)
                    .font(.largeTitle)
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill(theme.color).opacity(card.isFaceUp ? 0 : 1)
            }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        }
}

#Preview {
    let game = MyMemoGame(theme: DefaultThemes.redTheme)
    game.choose(card: game.cards[0])
    return ContentView(viewModel: game)
}
