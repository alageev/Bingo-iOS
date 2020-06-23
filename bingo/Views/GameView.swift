//
//  GameView.swift
//  bingo
//
//  Created by Алексей Агеев on 26.05.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import SwiftUI

//let str: Bingo

struct GameView: View {
    @State private var buttons = [
        [false, false, false, false, false],
        [false, false, false, false, false],
        [false, false, false, false, false],
        [false, false, false, false, false],
        [false, false, false, false, false]
    ]
    @State var bingoAlert = false
    var bingo: BingoSet
    let code = "123456"
    let colors = [Color.blue, Color.green, Color.orange, Color.pink, Color.purple, Color.red, Color.yellow]
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(0...4, id: \.self) { i in
                        HStack{
                            Spacer()
                            ForEach(0...4, id: \.self) { j in
                                GameCell(word: self.bingo.words[5 * i + j], isPressed: $buttons[i][j])
                            }
                            Spacer()
                        }
                        .fixedSize()
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitle(bingo.name)
    }
    
    func checkForCombination() -> Bool {
        return true
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView(bingo: bingoData[0]).colorScheme(.light)
            GameView(bingo: bingoData[0]).colorScheme(.dark)
        }
    }
}

