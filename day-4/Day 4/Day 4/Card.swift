//
//  Card.swift
//  Day 4
//
//  Created by Sören Kuklau on 15.12.23.
//

import Foundation

class Card {
    let winningNumbers: [Int]
    let yourNumbers: [Int]

    let id: Int

    init(line: String) {
        let regex = /Card\s+(?<Id>\d+):(?<Winning>[\d ]+)|(?<Yours>[\d ]+)/
        let numbers = /\d+/

        let matches = line.matches(of: regex)

        self.id = Int(matches[0].output.Id!)!

        let winning = matches[0].Winning!.matches(of: numbers)
        let yours = matches[1].Yours!.matches(of: numbers)

        self.winningNumbers = winning.map { Int($0.output)! }
        self.yourNumbers = yours.map { Int($0.output)! }
    }

    lazy var matches: Set<Int> = Set(winningNumbers).intersection(yourNumbers)

    func getPoints() -> Int {
        let matches = self.matches

        let points = pow(2, matches.count - 1)

        if points == Decimal.nan {
            return 0
        }

        return Int(truncating: NSDecimalNumber(decimal: points))
    }

    static func getCardsById(input: [String]) -> [Int: Card] {
        var cardsById = [Int: Card]()

        for line in input {
            let card = Card(line: line)

            cardsById[card.id] = card
        }

        return cardsById
    }

    static func processCards(cardsById: [Int: Card]) -> [Card] {
        var winningCards = [Card]()

        var cardsToProcess = [Card]()

        for card in cardsById.values.sorted(by: { $0.id < $1.id }) {
            cardsToProcess.append(card)
        }

        var countDiff = 0

        while cardsToProcess.count > 0 {
            let winningCount = winningCards.count

            if winningCount % 100_000 == 0 {
                let processCount = cardsToProcess.count
                countDiff = processCount - countDiff

                let percentage: Float = winningCount > 0 ? Float(processCount) / Float(winningCount) : 1

                print("currently at \(winningCount); \(processCount) more to process (\(percentage * 100)%; \(countDiff) more than last time)")

//                let processCount = cardsToProcess.count
//
//                print("currently at \(winningCount); \(processCount) more to process")
            }

            let card = cardsToProcess.removeFirst()

            let matches = card.matches

            winningCards.append(card)

            if matches.count == 0 {
//                print("Card \(card.id): no matches; currently at \(winningCards.count)")

                continue
            }

//            print("Card \(card.id): adding itself, and processing \(card.id + 1) through \(card.id + matches.count)")

            for i in card.id ..< (card.id + matches.count) {
                cardsToProcess.append(cardsById[i + 1]!)
            }
        }

        return winningCards
    }
}
