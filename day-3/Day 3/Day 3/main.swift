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

print(sum)
