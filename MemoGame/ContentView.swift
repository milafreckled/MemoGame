//
//  ContentView.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MyMemoGame
    var changeTheme : some View{
        HStack{
            ThemeButton(theme: DefaultThemes.redTheme, action: { viewModel.changeTheme(theme:  DefaultThemes.redTheme)}, imageName: "heart")
            ThemeButton(theme: DefaultThemes.greenTheme, action: { viewModel.changeTheme(theme:  DefaultThemes.greenTheme)}, imageName: "star")
            ThemeButton(theme: DefaultThemes.blueTheme, action: { viewModel.changeTheme(theme:  DefaultThemes.blueTheme)}, imageName: "car")
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

        VStack {
            Text("Memo")
                .navigationBarTitleDisplayMode(.inline)
                .font(.largeTitle)
                .padding()
            ScrollView{
                LazyVGrid(columns: [GridItem(.fixed(85)), GridItem(.fixed(85)), GridItem(.fixed(85)), GridItem(.fixed(85))], spacing: 10){
                    ForEach(viewModel.cards){card in
                        CardView(card: card).onTapGesture{
                            withAnimation(.easeInOut(duration: 0.5)){
                                viewModel.choose(card: card)
                            }
                        }
                        
                    }
                    Spacer()
                }.padding()
            }
            VStack{
                Button {
                    viewModel.shuffle()
                } label: {
                    Text("WYMIESZAJ").font(.title2).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }.frame(maxWidth: .infinity)
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


#Preview {
    let game = MyMemoGame(theme: DefaultThemes.redTheme)
    game.choose(card: game.cards[0])
    return ContentView(viewModel: game)
}
