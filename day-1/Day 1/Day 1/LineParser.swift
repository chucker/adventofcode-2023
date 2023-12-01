//
//  LineParser.swift
//  Day 1
//
//  Created by Sören Kuklau on 01.12.23.
//

import Foundation

struct LineParser {
    init(line: String) {
        self.line = line
    }

    let line: String

    func getFirstAndLastDigit() -> (String, String) {
        var indices = [String.Index: String]()

        for num in ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"] {
            for index in line.indices(of: num) {
                indices[index] = LineParser.parseNum(num: num)!
            }
        }

        for index in 0 ..< line.count {
            let stringIndex = String.Index(utf16Offset: index, in: line)

            let char = line[stringIndex]

            if char.isNumber {
                indices[stringIndex] = String(char.wholeNumberValue!)
            }
        }

        let sortedKeys = indices.keys.sorted(by: <)

        let firstDigit = indices[sortedKeys.first!]
        let lastDigit = indices[sortedKeys.last!]

        return (firstDigit!, lastDigit!)
    }

    static func parseNum(num: String) -> String? {
        switch num {
        case "one":
            return "1"
        case "two":
            return "2"
        case "three":
            return "3"
        case "four":
            return "4"
        case "five":
            return "5"
        case "six":
            return "6"
        case "seven":
            return "7"
        case "eight":
            return "8"
        case "nine":
            return "9"
        default:
            return nil
        }
    }

    func getCalibrationValue() -> Int {
        let digits = getFirstAndLastDigit()

        return Int(digits.0 + digits.1)!
    }
}

// https://stackoverflow.com/a/32306142
extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }

    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }

    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        ranges(of: string, options: options).map(\.lowerBound)
    }

    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
              let range = self[startIndex...]
              .range(of: string, options: options)
        {
            result.append(range)
            startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
