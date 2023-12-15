//
//  FinalInputTests.swift
//  Day 3 Tests
//
//  Created by Sören Kuklau on 07.12.23.
//

import XCTest

final class FinalInputTests: XCTestCase {
    var lines: [Line]?

    override func setUp() {
        let path = Bundle(for: FinalInputTests.self).path(forResource: "input", ofType: "txt")!

        let data = try! String(contentsOfFile: path, encoding: .utf8)
        lines = Line.buildLinesWithPreviousAndNext(linesInput: data.components(separatedBy: .newlines))
    }

    let countsAndSums = [(9, 8, 3330),
                         (3, 3, 1164),
                         (7, 6, 3720),
                         (8, 7, 3283),
                         (8, 8, 3561),
                         (9, 8, 3846),
                         (9, 8, 3263)]

    func testCountsAndSums() {
        for i in 0 ..< countsAndSums.count {
            let line = lines![i]
            let (expectedAllCount, expectedValidCount, expectedSum) = countsAndSums[i]

            let allNumbers = line.getNumbers()
            let validNumbers = line.getNumbersWithAdjacentSymbols()
            let sum = validNumbers.reduce(0, +)

            XCTAssertEqual(expectedAllCount, allNumbers.count)
            XCTAssertEqual(expectedValidCount, validNumbers.count)
            XCTAssertEqual(expectedSum, sum)
        }
    }
}
