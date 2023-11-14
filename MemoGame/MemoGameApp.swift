//
//  MemoGameApp.swift
//  MemoGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI
//
@main
struct MemoGameApp: App {
    let game = MyMemoGame(theme: DefaultThemes.redTheme)
//    game.choose(card: game.cards[0])
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MyMemoGame(theme: DefaultThemes.redTheme))
        }
    }
}
