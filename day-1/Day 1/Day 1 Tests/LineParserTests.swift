//
//  Day_1_Tests.swift
//  Day 1 Tests
//
//  Created by Sören Kuklau on 01.12.23.
//

import XCTest

final class LineParserTests: XCTestCase {
    let inputsPart1 = [("1abc2", "1", "2", 12),
                       ("pqr3stu8vwx", "3", "8", 38),
                       ("a1b2c3d4e5f", "1", "5", 15),
                       ("treb7uchet", "7", "7", 77)]
    
    let inputsPart2 = [("two1nine", "2", "9", 29),
                       ("eightwothree", "8", "3", 83),
                       ("abcone2threexyz", "1", "3", 13),
                       ("xtwone3four", "2", "4", 24),
                       ("4nineeightseven2", "4", "2", 42),
                       ("zoneight234", "1", "4", 14),
                       ("7pqrstsixteen", "7", "6", 76)]
    
    func testPart1() throws {
        try test(testCase: inputsPart1)
    }
    
    func testPart2() throws {
        try test(testCase: inputsPart2)
    }
    
    func test(testCase: [(String, String, String, Int)]) throws {
        for testCase in testCase {
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
