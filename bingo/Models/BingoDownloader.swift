//
//  BingoDownloader.swift
//  bingo
//
//  Created by Алексей Агеев on 23.06.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import Foundation

let bingosURL = "https://itmobingo.herokuapp.com/iphoneapp"

class BingoDownloader: ObservableObject {
    @Published var bingos: [BingoSet] = [BingoSet]()
    
    init() {
        guard let url = URL(string: bingosURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                var bingos = try JSONDecoder().decode([BingoSet].self, from: data)
                DispatchQueue.main.async {
                    for i in 0 ..< bingos.count {
                        if (bingos[i].words.count < 25){
                            for _ in bingos[i].words.count ..< 25 {
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
