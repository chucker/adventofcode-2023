//
//  RoundParser.swift
//  Day 2
//
//  Created by Sören Kuklau on 02.12.23.
//

import Foundation

struct RoundParser {
    static func parse(snippet: String) -> Round {
        let regex = /(?<amount>\d+) (?<color>blue|red|green)/

        var red = 0
        var green = 0
        var blue = 0

        for m in snippet.matches(of: regex) {
            switch m.output.color {
            case "red":
                red = Int(m.output.amount)!
            case "green":
                green = Int(m.output.amount)!
            case "blue":
                blue = Int(m.output.amount)!
            default:
                break
            }
        }

        return Round(red: red, green: green, blue: blue)
    }
}
