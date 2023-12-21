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
        let remainingTime = race.duration - holdDuration
        
        // there doesn't seem to be built-in support for a mm per ms velocity unit
//        let velocity = Measurement(value: holdDuration.value, unit: UnitSpeed.
        
        let velocity = holdDuration.value
        
        return Measurement(value: velocity * remainingTime.value, unit: UnitLength.millimeters)
    }
    
    func isSuccessful() -> Bool {
        let distance = getTravelledDistance()
        
        return distance > race.recordDistance
    }
}
