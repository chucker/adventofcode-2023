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

        let expectedResults = [81, 82, 83, 84, 85,
                               86, 87, 88, 89, 90,
                               91, 92, 93, 94,

                               57, 58, 59, 60, 61,
                               62, 63, 64, 65, 66,
                               67, 68, 69]

        for i in 0 ..< expectedResults.count {
            let seed = data.seeds[i]
            let expectedResult = expectedResults[i]

            let range = map.pickRange(input: seed)

            XCTAssertEqual(Range.map(input: seed, range: range), expectedResult)
        }
    }
}
