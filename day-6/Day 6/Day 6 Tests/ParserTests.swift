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
        
        XCTAssertEqual(races.count, 3)

        XCTAssertEqual(races[0].duration, Measurement(value: 7, unit: UnitDuration.milliseconds))
        XCTAssertEqual(races[0].recordDistance, Measurement(value: 9, unit: UnitLength.millimeters))

        XCTAssertEqual(races[1].duration, Measurement(value: 15, unit: UnitDuration.milliseconds))
        XCTAssertEqual(races[1].recordDistance, Measurement(value: 40, unit: UnitLength.millimeters))
    }
}
