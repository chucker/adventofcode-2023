//
//  AttemptTests.swift
//  Day 6
//
//  Created by Sören Kuklau on 21.12.23.
//

import XCTest

final class AttemptTests: XCTestCase {
    let race1 = Race(duration: Measurement(value: 7.0, unit: UnitDuration.milliseconds),
                    recordDistance: Measurement(value: 9.0, unit: UnitLength.millimeters))

    let input = [(holdDuration: 0.0, expectedDistance: 0.0, expectedSuccess: false),
                 (holdDuration: 1.0, expectedDistance: 6.0, expectedSuccess: false),
                 (holdDuration: 2.0, expectedDistance: 10.0, expectedSuccess: true),
                 (holdDuration: 3.0, expectedDistance: 12.0, expectedSuccess: true),
                 (holdDuration: 4.0, expectedDistance: 12.0, expectedSuccess: true),
                 (holdDuration: 5.0, expectedDistance: 10.0, expectedSuccess: true),
                 (holdDuration: 6.0, expectedDistance: 6.0, expectedSuccess: false),
                 (holdDuration: 7.0, expectedDistance: 0.0, expectedSuccess: false)]

    func testGetTravelledDistance() throws {
        for tuple in input {
            let attempt = Attempt(holdDuration: Measurement(value: tuple.holdDuration, unit: UnitDuration.milliseconds),
                                  race: race1)

            XCTAssertEqual(Measurement(value: tuple.expectedDistance, unit: UnitLength.millimeters),
                           attempt.getTravelledDistance())
        }
    }

    func testIsSuccessful() throws {
        for tuple in input {
            let attempt = Attempt(holdDuration: Measurement(value: tuple.holdDuration, unit: UnitDuration.milliseconds),
                                  race: race1)

            XCTAssertEqual(tuple.expectedSuccess, attempt.isSuccessful())
        }
    }
}
