//
//  main.swift
//  Day 1
//
//  Created by Sören Kuklau on 01.12.23.
//

import Foundation

let path = Bundle.main.path(forResource: "input", ofType: "txt")!

let data = try! String(contentsOfFile: path, encoding: .utf8)
let lines = data.components(separatedBy: .newlines)

var total: Int = 0

for line in lines {
    if line.isEmpty {
        continue
    }

    let parser = LineParser(line: line)
    total += parser.getCalibrationValue()

    print(total)
}
