//
//  CardTests.swift
//  Day 4 Tests
//
//  Created by Sören Kuklau on 15.12.23.
//

import XCTest

final class CardTests: XCTestCase {
    let input = ["Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53",
                 "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19",
                 "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1",
                 "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83",
                 "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36",
                 "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"]

    let expectedPoints: [Int] = [8, 2, 2, 1, 0, 0]

    func testParseLine() throws {
        var id = 1

        for line in input {
            let card = Card(line: line)

            XCTAssertEqual(card.winningNumbers.count, 5)
            XCTAssertEqual(card.yourNumbers.count, 8)

            XCTAssertEqual(card.id, id)

            id += 1
        }
    }

    func testPoints() throws {
        for i in 0 ..< expectedPoints.count {
            let card = Card(line: input[i])
            let points = expectedPoints[i]

            XCTAssertEqual(card.getPoints(), points)
        }
    }

    func testWonScratchcards() throws {
        let cardsById = Card.getCardsById(input: input)
        let winningCards = Card.processCards(cardsById: cardsById)

        XCTAssertEqual(winningCards.count, 30)
    }
}
