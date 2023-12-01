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
        var firstDigit: String?
        var lastDigit: String?

        for c in line {
            if c.isNumber {
                firstDigit = String(c)
                break
            }
        }

        for c in line.reversed() {
            if c.isNumber {
                lastDigit = String(c)
                break
            }
        }

        return (firstDigit!, lastDigit!)
    }
    
    func getCalibrationValue() -> Int {
        let digits = getFirstAndLastDigit()
        
        return Int(digits.0 + digits.1)!
    }
}
