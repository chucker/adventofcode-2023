//
//  AttemptTests.swift
//  Day 6
//
//  Created by Sören Kuklau on 21.12.23.
//

import XCTest

final class AttemptTests: XCTestCase {
    let races = [Race(duration: Measurement(value: 7.0, unit: UnitDuration.milliseconds),
                      recordDistance: Measurement(value: 9.0, unit: UnitLength.millimeters)),

                 Race(duration: Measurement(value: 15.0, unit: UnitDuration.milliseconds),
                      recordDistance: Measurement(value: 40.0, unit: UnitLength.millimeters)),

                 Race(duration: Measurement(value: 30.0, unit: UnitDuration.milliseconds),
                      recordDistance: Measurement(value: 200.0, unit: UnitLength.millimeters))]

    let part2Race = Race(duration: Measurement(value: 71_530, unit: UnitDuration.milliseconds),
                         recordDistance: Measurement(value: 940_200, unit: UnitLength.millimeters))

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
                                  race: races[0])

            XCTAssertEqual(Measurement(value: tuple.expectedDistance, unit: UnitLength.millimeters),
                           attempt.getTravelledDistance())
        }
    }

    func testIsSuccessful() throws {
        for tuple in input {
            let attempt = Attempt(holdDuration: Measurement(value: tuple.holdDuration, unit: UnitDuration.milliseconds),
                                  race: races[0])

            XCTAssertEqual(tuple.expectedSuccess, attempt.isSuccessful())
        }
    }

    func testCountSuccessful() throws {
        let expectedCounts = [4, 8, 9]

        for i in 0 ..< expectedCounts.count {
            let expectedCount = expectedCounts[i]
            let race = races[i]

            XCTAssertEqual(expectedCount, race.getAllSuccessfulPossibilities().count)
        }
    }

    func testCountSuccessfulPart2() throws {
        let expectedCount = 71_503

        let race = part2Race

        XCTAssertEqual(expectedCount, race.getAllSuccessfulPossibilities().count)
    }

    func testScore() throws {
        let expectedScore = 288

        let actualScore = Race.getPart1Score(races: races)

        XCTAssertEqual(expectedScore, actualScore)
    }
}
