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

    func getNumbers() -> [Int] {
        let regex = /\d+/

        var result = [Int]()

        for m in text.matches(of: regex) {
            let s = String(m.output)
            if let i = Int(s) {
                result.append(i)
            }
        }

        return result
    }

    func getSymbols() -> [String] {
        let regex = /[^\d\.]/

        var result = [String]()

        for m in text.matches(of: regex) {
            let s = String(m.output)
            result.append(s)
        }

        return result
    }
}
