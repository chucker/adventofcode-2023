//
//  Day_2_Tests.swift
//  Day 2 Tests
//
//  Created by Sören Kuklau on 02.12.23.
//

import XCTest

final class GameParserTests: XCTestCase {
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
}
