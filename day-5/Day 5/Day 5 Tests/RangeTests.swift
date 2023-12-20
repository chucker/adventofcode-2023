//
//  RangeTests.swift
//  Day 5 Tests
//
//  Created by Sören Kuklau on 20.12.23.
//

import XCTest

class RangeTests: XCTestCase {
    func testMap() throws {
        let data = Data(input: DataTests.input)

        let map = data.maps[0]

        let expectedResults = [81, 14, 57, 13]

        for i in 0 ..< expectedResults.count {
            let seed = data.seeds[i]
            let expectedResult = expectedResults[i]

            let range = map.pickRange(input: seed)

            XCTAssertEqual(Range.map(input: seed, range: range), expectedResult)
        }
    }
}
