//
//  BingoSelect.swift
//  bingo
//
//  Created by Алексей Агеев on 30.05.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import SwiftUI

let bingosURL = "http://192.168.0.44:8080/iphoneapp"

struct Bingo: Hashable, Codable {
    var id: Int
    var author: String
    var words: [String]
    var name: String
    var accepted: Bool
//    var maxWidth: CGFloat {
//        var width: CGFloat = 0
//        for word in words {
//            let fontAttributes = [NSAttributedString.Key.font: Font.title]
//            let size = word.size(withAttributes: fontAttributes)
//            if size.width > width {
//                width = size.width
//            }
//        }
//        return ceil(width)
//    }
    
    enum CodingKeys: CodingKey {
        case id, author, words, name, accepted
    }
}

class BingoDownloader: ObservableObject {
    @Published var bingos: [Bingo] = [Bingo]()

    init() {
        guard let url = URL(string: bingosURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                var bingos = try JSONDecoder().decode([Bingo].self, from: data)
                DispatchQueue.main.async {
                    for i in 0..<bingos.count {
                        if (bingos[i].words.count < 25){
                            for _ in bingos[i].words.count..<25 {
                                bingos[i].words.append("Tap on me!")
                            }
                        }
                        bingos[i].words.shuffle()
                    }
                    self.bingos = bingos
                }
            } catch {
                print("Error decoding JSON: ", error)
            }
        }.resume()
    }
}

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
