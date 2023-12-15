//
//  Line.swift
//  Day 3
//
//  Created by Sören Kuklau on 03.12.23.
//

import Foundation

class Line {
    let text: String

    var previous: Line?
    var next: Line?

    init(text: String) {
        self.text = text
    }

    static func buildLinesWithPreviousAndNext(linesInput: [String]) -> [Line] {
        var lines = [Line]()

        for s in linesInput {
            let line = Line(text: s)

            if let last = lines.last {
                line.previous = last
                last.next = line
            }

            lines.append(line)
        }

        return lines
    }

    func getNumbers() -> [(Int, Int)] {
        let regex = /\d+/

        var result = [(Int, Int)]()

        for m in text.matches(of: regex) {
            let s = String(m.output)
            if let i = Int(s) {
                result.append((m.startIndex.utf16Offset(in: text), i))
            }
        }

        return result
    }

    func getSymbols() -> [(Int, String)] {
        let regex = /[^\d\.]/

        var result = [(Int, String)]()

        for m in text.matches(of: regex) {
            let s = String(m.output)
            result.append((m.startIndex.utf16Offset(in: text), s))
        }

        return result
    }

    func getNumbersWithAdjacentSymbols() -> [Int] {
        let currentSymbols = getSymbols()
        let previousSymbols = previous?.getSymbols()
        let nextSymbols = next?.getSymbols()

        let regex = /\d+/

        var result = [Int]()

        for m in text.matches(of: regex) {
            let s = String(m.output)

            let startIndex = m.startIndex.utf16Offset(in: text)
            let endIndex = m.endIndex.utf16Offset(in: text) - 1

            var hasAdjacentSymbol = false

            for symbols in [currentSymbols, previousSymbols, nextSymbols] {
                if symbols?.filter({ index, _ in
                    index >= startIndex - 1 && index <= endIndex + 1
                }).isEmpty == false {
                    hasAdjacentSymbol = true
                    break
                }
            }

            if hasAdjacentSymbol, let i = Int(s) {
                result.append(i)
            }
        }

        return result
    }

    func getGearRatios() -> [Int] {
        let symbolLocations = getSymbols().filter { $0.1 == "*" }.map { $0.0 }

        let previousNumbers = previous?.getNumbers()
        let currentNumbers = getNumbers()
        let nextNumbers = next?.getNumbers()

        var gearRatios = [Int]()

        for sl in symbolLocations {
            var adjacentNumbers = [Int]()

            for numbers in [previousNumbers, currentNumbers, nextNumbers] {
                guard let numbers else { continue }

                for number in numbers {
                    let startIndex = number.0
                    let endIndex = number.0 + String(number.1).count - 1

                    if sl >= startIndex - 1, sl <= endIndex + 1 {
                        adjacentNumbers.append(number.1)
                    }
                }
            }

            if adjacentNumbers.count == 2 {
                gearRatios.append(adjacentNumbers.reduce(1, *))
            }
        }

        return gearRatios
    }
}
