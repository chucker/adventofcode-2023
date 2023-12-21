//
//  ParserTests.swift
//  Day 6 Tests
//
//  Created by Sören Kuklau on 21.12.23.
//

import XCTest

final class ParserTests: XCTestCase {
    let input = #"""
Time:      7  15   30
Distance:  9  40  200
"""#
    
    func testExample() throws {
        let races = Parser.parse(input: input)
        
        XCTAssertEqual(races.count, 1)

        XCTAssertEqual(races[0].duration, Measurement(value: 71530, unit: UnitDuration.milliseconds))
        XCTAssertEqual(races[0].recordDistance, Measurement(value: 940200, unit: UnitLength.millimeters))
    }
}
