//
//  Day_3_Tests.swift
//  Day 3 Tests
//
//  Created by Sören Kuklau on 03.12.23.
//

import XCTest

final class LineTests: XCTestCase {
    let linesInput = ["467..114..",
                      "...*......",
                      "..35..633.",
                      "......#...",
                      "617*......",
                      ".....+.58.",
                      "..592.....",
                      "......755.",
                      "...$.*....",
                      ".664.598.."]
    
    let numbers = [[467, 114],
                   [],
                   [35, 633],
                   [],
                   [617],
                   [58],
                   [592],
                   [755],
                   [],
                   [664, 598]]
    
    let symbols = [[],
                   ["*"],
                   [],
                   ["#"],
                   ["*"],
                   ["+"],
                   [],
                   [],
                   ["$", "*"],
                   []]
    
    func testPreviousNext() throws {
        var lines = [Line]()
        
        for s in linesInput {
            let line = Line(text: s)
            
            if let last = lines.last {
                line.previous = last
                last.next = line
            }
            
            lines.append(line)
        }
        
        XCTAssertNil(lines.first!.previous)
        XCTAssertNil(lines.last!.next)
        XCTAssertNotNil(lines.first!.next)
        XCTAssertNotNil(lines.last!.previous)
        XCTAssertEqual(linesInput.count, lines.count)
    }
    
    func testGetNumbers() throws {
        for i in 0..<linesInput.count {
            let line = Line(text: linesInput[i])
            let expectedNumbers = numbers[i]
            
            XCTAssertEqual(line.getNumbers(), expectedNumbers)
        }
    }
    
    func testGetSymbols() throws {
        for i in 0..<linesInput.count {
            let line = Line(text: linesInput[i])
            let expectedSymbols = symbols[i]
            
            XCTAssertEqual(line.getSymbols(), expectedSymbols)
        }
    }
}
