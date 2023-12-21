//
//  Attempt.swift
//  Day 6
//
//  Created by Sören Kuklau on 21.12.23.
//

import Foundation

struct Attempt {
    let holdDuration: Measurement<UnitDuration>
    let race: Race

    func getTravelledDistance() -> Measurement<UnitLength> {
        Measurement(value: 0, unit: UnitLength.millimeters)
    }
}
