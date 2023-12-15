//
//  main.swift
//  Day 4
//
//  Created by Sören Kuklau on 15.12.23.
//

import Foundation

let path = Bundle.main.path(forResource: "input", ofType: "txt")!

let data = try! String(contentsOfFile: path, encoding: .utf8)
let linesInput = data.components(separatedBy: .newlines).filter { $0 != "" }

var sum: Int = 0

for line in linesInput {
    let card = Card(line: line)
    sum += card.getPoints()
}

print(sum)

let cardsById = Card.getCardsById(input: linesInput)
let winningCards = Card.processCards(cardsById: cardsById)

print(winningCards.count)
