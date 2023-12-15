//
//  Card.swift
//  Day 4
//
//  Created by Sören Kuklau on 15.12.23.
//

import Foundation

struct Card {
    let winningNumbers: [Int]
    let yourNumbers: [Int]

    init(line: String) {
        let regex = /Card \d+:(?<Winning>[\d ]+)|(?<Yours>[\d ]+)/
        let numbers = /\d+/

        let matches = line.matches(of: regex)

        let winning = matches[0].Winning!.matches(of: numbers)
        let yours = matches[1].Yours!.matches(of: numbers)

        self.winningNumbers = winning.map { Int($0.output)! }
        self.yourNumbers = yours.map { Int($0.output)! }
    }

    func getPoints() -> Int {
        let matches = Set(winningNumbers).intersection(yourNumbers)

        let points = pow(2, matches.count - 1)

        if points == Decimal.nan {
            return 0
        }

        return Int(truncating: NSDecimalNumber(decimal: points))
    }
}
