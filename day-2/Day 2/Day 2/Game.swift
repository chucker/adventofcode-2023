//
//  Game.swift
//  Day 2
//
//  Created by Sören Kuklau on 02.12.23.
//

import Foundation

struct Game {
    let id: Int
    let rounds: [Round]

    func possibleWith(bag: Bag) -> Bool {
        for round in rounds {
            if bag.red < round.red {
                return false
            }
            if bag.green < round.green {
                return false
            }
            if bag.blue < round.blue {
                return false
            }
        }
        
        return true
    }
}
