//
//  RangeTests.swift
//  Day 5 Tests
//
//  Created by Sören Kuklau on 20.12.23.
//

import XCTest

class RangeTests: XCTestCase {
    let ranges = [Range(destinationStart: 50, sourceStart: 98, length: 2),
                  Range(destinationStart: 52, sourceStart: 50, length: 48)]
    
    let seeds = [79, 14, 55, 13]
    
    func testMap() throws {
        let range = ranges[1]
        let seed = seeds[0]
    }
}
