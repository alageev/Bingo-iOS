//
//  Data.swift
//  bingo
//
//  Created by Алексей Агеев on 23.06.2020.
//  Copyright © 2020 Alexey Ageev. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation

let bingoData: [BingoSet] = load("bingoExample.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
