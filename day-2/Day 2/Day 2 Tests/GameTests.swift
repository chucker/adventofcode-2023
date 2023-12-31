//
//  Day_2_Tests.swift
//  Day 2 Tests
//
//  Created by Sören Kuklau on 02.12.23.
//

import XCTest

final class GameTests: XCTestCase {
    let testCases = [("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green", 1, 3),
                     ("Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue", 2, 3),
                     ("Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red", 3, 3),
                     ("Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red", 4, 3),
                     ("Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green", 5, 2)]

    func test() throws {
        for testCase in testCases {
            let result = GameParser.parse(line: testCase.0)

            XCTAssertNotNil(result)

            XCTAssertEqual(result.id, testCase.1)
            XCTAssertEqual(result.rounds.count, testCase.2)
        }
    }
    
    func testBagPossible() {
        var games=[Int:Game]()
        
        for testCase in testCases {
            let game = GameParser.parse(line: testCase.0)
            games[game.id] = game
        }
        
        let bag = Bag(red: 12, green: 13, blue: 14)
        
        XCTAssert(games[1]!.possibleWith(bag: bag))
        XCTAssert(games[2]!.possibleWith(bag: bag))
        XCTAssertFalse(games[3]!.possibleWith(bag: bag))
        XCTAssertFalse(games[4]!.possibleWith(bag: bag))
        XCTAssert(games[5]!.possibleWith(bag: bag))
        
        XCTAssertEqual(Game.sumPossible(games: Array(games.values), bag: bag), 8)
    }
    
    let expectedBags = [(Bag(red: 4, green: 2, blue: 6), 48),
                        (Bag(red: 1, green: 3, blue: 4), 12),
                        (Bag(red: 20, green: 13, blue: 6), 1_560),
                        (Bag(red: 14, green: 3, blue: 15), 630),
                        (Bag(red: 6, green: 3, blue: 2), 36)]
    
    func testSmallestPossibleBag() {
        for i in 0..<expectedBags.count {
            let testCase = testCases[i]
            let game = GameParser.parse(line: testCase.0)
            
            let actualBag = game.smallestPossibleBag()
            let expectedBag = expectedBags[i].0
            
            XCTAssertEqual(actualBag, expectedBag)
            
            let expectedPower = expectedBags[i].1

            XCTAssertEqual(actualBag.power(), expectedPower)
        }
    }
}
