//
//  main.swift
//  Day 6
//
//  Created by Sören Kuklau on 21.12.23.
//

import Foundation

let path = Bundle.main.path(forResource: "input", ofType: "txt")!

let input = try! String(contentsOfFile: path, encoding: .utf8)

let races = Parser.parse(input: input)

let score = Race.getScore(races: races)

print(score)
