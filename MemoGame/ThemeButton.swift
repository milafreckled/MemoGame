//
//  ThemeButton.swift
//  MemoGame
//
//  Created by Людмила Маломуж on 09/11/2023.
//

import Foundation
import SwiftUI

struct ThemeButton: View{
    @State var theme: Theme
    @State var action: () -> Void
    var imageName: String;
    var body: some View{
        Button(action: {action()})
        {
            VStack{
                ZStack{
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        
                    Text(theme.name)
                        .font(.caption)
                        .foregroundColor(theme.color)
                }
            }
        }.padding()
    }
}
