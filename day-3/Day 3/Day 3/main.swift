//
//  main.swift
//  Day 3
//
//  Created by Sören Kuklau on 03.12.23.
//

import Foundation

let path = Bundle.main.path(forResource: "input", ofType: "txt")!

let data = try! String(contentsOfFile: path, encoding: .utf8)
let linesInput = data.components(separatedBy: .newlines)

var sum: Int = 0

let lines = Line.buildLinesWithPreviousAndNext(linesInput: linesInput)

for line in lines {
    let numbers = line.getNumbersWithAdjacentSymbols()

    for number in numbers {
        sum += number
    }
}

print("Sum of numbers with adjacent symbols: \(sum)")

var gearRatios = 0

for line in lines {
    for gearRatio in line.getGearRatios() {
        gearRatios += gearRatio
    }
}

print("Sum of gear ratios: \(gearRatios)")
