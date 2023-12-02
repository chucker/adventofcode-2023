//
//  Bag.swift
//  Day 2
//
//  Created by Sören Kuklau on 02.12.23.
//

import Foundation

struct Bag : Equatable {
    let red: Int
    let green: Int
    let blue: Int
    
    func power() -> Int {
        red * green * blue
    }
}
