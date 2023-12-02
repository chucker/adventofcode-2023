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

    func smallestPossibleBag() -> Bag {
        let red = rounds.map { r in r.red }.max() ?? 0
        let green = rounds.map { r in r.green }.max() ?? 0
        let blue = rounds.map { r in r.blue }.max() ?? 0

        return Bag(red: red, green: green, blue: blue)
    }

    static func sumPossible(games: [Game], bag: Bag) -> Int {
        var result = 0

        for game in games {
            if game.possibleWith(bag: bag) {
                result += game.id
            }
        }

        return result
    }
}
