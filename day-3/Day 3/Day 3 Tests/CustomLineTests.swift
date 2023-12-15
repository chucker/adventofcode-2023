//
//  CustomLineTests.swift
//  Day 3 Tests
//
//  Created by Sören Kuklau on 15.12.23.
//

import XCTest

final class CustomLineTests : XCTestCase {
    let testData = [(["10..",
                      "...*"], 0)]
    
    func test() throws {
        for tuple in testData {
            let lines = Line.buildLinesWithPreviousAndNext(linesInput: tuple.0)
            let expectedSum = tuple.1
            
            var sum = 0
            
            for i in 0..<lines.count {
                let line = lines[i]
                for number in line.getNumbersWithAdjacentSymbols() {
                    sum += number
                }
            }
            
            XCTAssertEqual(sum, expectedSum)
        }
    }
}
