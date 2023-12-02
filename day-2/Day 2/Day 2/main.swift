//
//  main.swift
//  Day 2
//
//  Created by Sören Kuklau on 02.12.23.
//

import Foundation

let path = Bundle.main.path(forResource: "input", ofType: "txt")!

let data = try! String(contentsOfFile: path, encoding: .utf8)
let lines = data.components(separatedBy: .newlines)

var games = [Game]()

for line in lines {
    if line.isEmpty {
        continue
    }

    games.append(GameParser.parse(line: line))
}

let bag = Bag(red: 12, green: 13, blue: 14)

print(Game.sumPossible(games: games, bag: bag))

var sumPower = 0

for game in games {
    sumPower += game.smallestPossibleBag().power()
}

print(sumPower)
