//
//  main.swift
//  Day 5
//
//  Created by Sören Kuklau on 20.12.23.
//

import Foundation

let path = Bundle.main.path(forResource: "input", ofType: "txt")!

let input = try! String(contentsOfFile: path, encoding: .utf8)

let data = Data(input: input)

var values = data.seeds

for i in 0 ..< values.count {
    for map in data.maps {
        let oldValue = values[i]

        let range = map.pickRange(input: oldValue)
        let value = Range.map(input: oldValue, range: range)
        
        values[i] = value

        print("\(map.name): \(oldValue) -> \(value)")
    }
}

let lowestValue = values.min()

print(lowestValue ?? 0)
