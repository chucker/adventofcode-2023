//
//  ParserTests.swift
//  Day 5 Tests
//
//  Created by Sören Kuklau on 20.12.23.
//

import XCTest

class DataTests: XCTestCase {
    let input = #"""
    seeds: 79 14 55 13

    seed-to-soil map:
    50 98 2
    52 50 48

    soil-to-fertilizer map:
    0 15 37
    37 52 2
    39 0 15

    fertilizer-to-water map:
    49 53 8
    0 11 42
    42 0 7
    57 7 4

    water-to-light map:
    88 18 7
    18 25 70

    light-to-temperature map:
    45 77 23
    81 45 19
    68 64 13

    temperature-to-humidity map:
    0 69 1
    1 0 69

    humidity-to-location map:
    60 56 37
    56 93 4
    """#

    func testParsing() throws {
        let result = Data(input: input)

        XCTAssertEqual(result.seeds.count, 4)

        XCTAssertEqual(result.maps.count, 7)
        XCTAssertEqual(result.maps[0].name, "seed-to-soil")
        XCTAssertGreaterThan(result.maps[0].ranges.count, 0)
    }

    func testPickRange() throws {
        let data = Data(input: self.input)
        let map = data.maps[0]

        var input = 79
        var expectedResult: Range? = Range(destinationStart: 52, sourceStart: 50, length: 48)

        XCTAssertEqual(expectedResult, map.pickRange(input: input))

        input = 14
        expectedResult = nil

        XCTAssertEqual(expectedResult, map.pickRange(input: input))

        input = 99
        expectedResult = Range(destinationStart: 50, sourceStart: 98, length: 2)

        XCTAssertEqual(expectedResult, map.pickRange(input: input))
    }
}
