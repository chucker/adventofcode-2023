//
//  AttemptTests.swift
//  Day 6
//
//  Created by Sören Kuklau on 21.12.23.
//

import XCTest

final class AttemptTests: XCTestCase {
    func testGetTravelledDistance() throws {
        let input = [(holdDuration: 0.0, raceDuration: 7.0, recordDistance: 9.0, expectedDistance: 0.0),
                     (holdDuration: 1.0, raceDuration: 7.0, recordDistance: 9.0, expectedDistance: 6.0),
                     (holdDuration: 2.0, raceDuration: 7.0, recordDistance: 9.0, expectedDistance: 10.0)]

        for tuple in input {
            let race = Race(duration: Measurement(value: tuple.raceDuration, unit: UnitDuration.milliseconds),
                            recordDistance: Measurement(value: tuple.recordDistance, unit: UnitLength.millimeters))
            let attempt = Attempt(holdDuration: Measurement(value: tuple.holdDuration, unit: UnitDuration.milliseconds), race: race)

            XCTAssertEqual(Measurement(value: tuple.expectedDistance, unit: UnitLength.millimeters),
                           attempt.getTravelledDistance())
        }
    }
}
