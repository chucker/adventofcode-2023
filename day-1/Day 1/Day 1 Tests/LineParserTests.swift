//
//  Day_1_Tests.swift
//  Day 1 Tests
//
//  Created by Sören Kuklau on 01.12.23.
//

import XCTest

final class LineParserTests: XCTestCase {
    func testExample() throws {
        let testCases = [("1abc2", "1", "2", 12),
                         ("pqr3stu8vwx", "3", "8", 38),
                         ("a1b2c3d4e5f", "1", "5", 15),
                         ("treb7uchet", "7", "7", 77)]

        for testCase in testCases {
            let input = testCase.0

            let parser = LineParser(line: input)

            let digitsResult = parser.getFirstAndLastDigit()

            XCTAssertEqual(digitsResult.0, testCase.1)
            XCTAssertEqual(digitsResult.1, testCase.2)

            let expectedCalibrationValue = testCase.3

            let actualCalibrationValue = parser.getCalibrationValue()

            XCTAssertEqual(expectedCalibrationValue, actualCalibrationValue)
        }
    }
}
