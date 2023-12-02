//
//  File.swift
//  Day 2 Tests
//
//  Created by Sören Kuklau on 02.12.23.
//

import XCTest

final class RoundParserTests: XCTestCase {
    let testCases = [("3 blue, 4 red", Round(red: 4, green: 0, blue: 3)),
                     ("1 red, 2 green, 6 blue", Round(red: 1, green: 2, blue: 6)),
                     ("3 green, 4 blue", Round(red: 0, green: 3, blue: 4))]
                      
    func test() {
        for testCase in testCases {
            let result = RoundParser.parse(snippet: testCase.0)
            
            XCTAssertNotNil(result)
            
            XCTAssertEqual(result.red, testCase.1.red)
            XCTAssertEqual(result.green, testCase.1.green)
            XCTAssertEqual(result.blue, testCase.1.blue)
        }
    }
}

