//
//  Parser.swift
//  Day 5
//
//  Created by Sören Kuklau on 20.12.23.
//

import Foundation

extension Array {
    func pair(at i: Index) -> (Element, Element?) {
        return (self[i], i < self.count - 1 ? self[i + 1] : nil)
    }

    func pairs() -> [(Element, Element?)] {
        guard !isEmpty else { return [] }
        return (0..<(self.count / 2 + self.count % 2)).map { self.pair(at: $0 * 2) }
    }
}

struct Data {
    var seeds = [Int]()

    var maps = [Map]()

    init(input: String) {
        let mapBeginRegex = /(?<Name>[\w-]+) map:/
        let rangeRegex = /(?<DestinationStart>\d+) (?<SourceStart>\d+) (?<Length>\d+)/

        var currentMap: Map?

        for line in input.components(separatedBy: CharacterSet.newlines) {
            if line.starts(with: "seeds:") {
                let allSeedNumbers = line.split(separator: ":")[1].split(separator: " ").map { Int(String($0))! }

                for pair in allSeedNumbers.pairs() {
                    for seed in pair.0..<(pair.0 + pair.1!) {
                        if seed % 1_000_000 == 0 {
                            print(seed)
                        }

                        self.seeds.append(seed)
                    }
            }
            else if let mapBegin = line.firstMatch(of: mapBeginRegex) {
                currentMap = Map(name: String(mapBegin.output.Name))

                self.maps.append(currentMap!)
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
