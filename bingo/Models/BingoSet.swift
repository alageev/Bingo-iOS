//
//  BingoSet.swift
//  bingo
//
//  Created by Алексей Агеев on 23.06.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import SwiftUI

struct BingoSet: Hashable, Codable {
    let id: Int
    let author: String
    var words: [String]
    let name: String
    let accepted: Bool
    
    enum CodingKeys: CodingKey {
        case id, author, words, name, accepted
    }
}
