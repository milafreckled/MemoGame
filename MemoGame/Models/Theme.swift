//
//  Theme.swift
//  MemoGame
//
//  Created by Людмила Маломуж on 08/11/2023.
//

import Foundation
import SwiftUI

struct Theme: Identifiable{
    var name: String
    var imageName: String?
    var color: Color
    var emojis: [String]
    var id = UUID()
    
    init(name: String, imageName: String = "", color: Color, emojis: [String]){
        self.name = name
        self.imageName = imageName
        self.color = color
        self.emojis = emojis
    }
}

struct DefaultThemes {
    static let redTheme = Theme(name: "Red", imageName: "pencil", color: .red,
                                emojis: ["🦀", "🧲", "🍎", "👹"])
    static let blueTheme = Theme(name: "Blue", imageName: "cloud", color: .blue,
                                emojis: ["🦋", "🐳", "🌊", "🚙", "💎"])
    static let greenTheme = Theme(name: "Green", imageName: "pencil", color: .green,
                                emojis: ["🐍", "☘️", "🥦", "🥑", "🧩", "🧪"])
}
