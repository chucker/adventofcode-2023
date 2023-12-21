//
//  Race.swift
//  Day 6
//
//  Created by Sören Kuklau on 21.12.23.
//

import Foundation

struct Race {
    let duration: Measurement<UnitDuration>
    let recordDistance: Measurement<UnitLength>
    
    func getAllSuccessfulPossibilities() -> [Attempt] {
        var attempts = [Attempt]()
        
        for i in 1 ..< Int(duration.value) {
            let holdDuration = Measurement(value: Double(i), unit: UnitDuration.milliseconds)
            
            let attempt = Attempt(holdDuration: holdDuration, race: self)
            
            attempts.append(attempt)
        }
        
        return attempts.filter { $0.isSuccessful() }
    }
    
    static func getScore(races: [Race]) -> Int {
        var result = 1
        
        for race in races {
            result *= race.getAllSuccessfulPossibilities().count
        }
        
        return result
    }
}
