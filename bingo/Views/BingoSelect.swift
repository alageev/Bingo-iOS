//
//  BingoSelect.swift
//  bingo
//
//  Created by Алексей Агеев on 30.05.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import SwiftUI

struct BingoSelect: View {
    @ObservedObject var bingoData: BingoDownloader = BingoDownloader()
    let bingos = ["first", "second", "third"]
    var body: some View {
        NavigationView {
            List(self.bingoData.bingos, id: \.id) { bingo in
                NavigationLink(destination: GameView(bingo: bingo)){
                    Text(bingo.name)
                }
            }
            .navigationBarTitle("Bingos")
        }
    }
}

struct BingoSelect_Previews: PreviewProvider {
    static var previews: some View {
        BingoSelect()
    }
}
