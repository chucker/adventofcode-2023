//
//  Parser.swift
//  Day 6
//
//  Created by Sören Kuklau on 21.12.23.
//

import Foundation

struct Parser {
    static func parse(input: String) -> [Race] {
        let pattern = /([\d\s]+)/

        var durations = [Int]()
        var distances = [Int]()

        for line in input.components(separatedBy: CharacterSet.newlines) {
            let matches = line.matches(of: pattern).map { Int(String($0.output.0.replacing(/\s/, with: "")))! }

            if line.starts(with: "Time") {
                durations.append(contentsOf: matches)
            } else if line.starts(with: "Distance") {
                distances.append(contentsOf: matches)
            }
        }

        var result = [Race]()

        for i in 0 ..< durations.count {
            let duration = Measurement(value: Double(durations[i]), unit: UnitDuration.milliseconds)
            let distance = Measurement(value: Double(distances[i]), unit: UnitLength.millimeters)

            result.append(Race(duration: duration, recordDistance: distance))
        }

        return result
    }
}
