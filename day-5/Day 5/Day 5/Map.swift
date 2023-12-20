//
//  Map.swift
//  Day 5
//
//  Created by Sören Kuklau on 20.12.23.
//

import Foundation

class Map {
    let name: String
    
    init(name: String) {
        self.name = name
    }

    var ranges = [Range]()
    
    func pickRange(input: Int) -> Range? {
        for range in ranges {
            if input >= range.sourceStart && input <= range.sourceEnd {
                return range
            }
        }
        
        return nil
    }
}
