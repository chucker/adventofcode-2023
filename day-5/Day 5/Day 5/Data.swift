//
//  Parser.swift
//  Day 5
//
//  Created by Sören Kuklau on 20.12.23.
//

import Foundation

struct Data {
    var seeds = [Int]()

    var maps = [Map]()

    init(input: String) {
        let mapBeginRegex = /(?<Name>[\w-]+) map:/
        let rangeRegex = /(?<DestinationStart>\d+) (?<SourceStart>\d+) (?<Length>\d+)/

        var currentMap: Map?

        for line in input.components(separatedBy: CharacterSet.newlines) {
            if line.starts(with: "seeds:") {
                seeds = line.split(separator: ":")[1].split(separator: " ").map { Int(String($0))! }
            }
            else if let mapBegin = line.firstMatch(of: mapBeginRegex) {
                currentMap = Map(name: String(mapBegin.output.Name))

                maps.append(currentMap!)
            }
            else if let currentMap, let range = line.firstMatch(of: rangeRegex) {
                let destinationStart = Int(String(range.output.DestinationStart))!
                let sourceStart = Int(String(range.output.SourceStart))!
                let length = Int(String(range.output.Length))!

                currentMap.ranges.append(Range(destinationStart: destinationStart, sourceStart: sourceStart, length: length))
            }
        }
    }
}
