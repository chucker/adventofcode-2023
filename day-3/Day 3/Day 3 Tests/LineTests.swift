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
                   [(3, "*")],
                   [],
                   [(6, "#")],
                   [(3, "*")],
                   [(5, "+")],
                   [],
                   [],
                   [(3, "$"), (5, "*")],
                   []]
    
    let numbersWithAdjacentSymbols = [[467],
                                      [],
                                      [35, 633],
                                      [],
                                      [617],
                                      [],
                                      [592],
                                      [755],
                                      [],
                                      [664, 598]]
    
    func testPreviousNext() throws {
        let lines = Line.buildLinesWithPreviousAndNext(linesInput: linesInput)
        
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
            
            XCTAssertEqual(line.getNumbers().map { $1 }, expectedNumbers)
        }
    }
    
    func testGetSymbols() throws {
        for i in 0..<linesInput.count {
            let line = Line(text: linesInput[i])
            
            let expectedSymbols = symbols[i]
            let actualSymbols = line.getSymbols()
            
            XCTAssertEqual(actualSymbols.count, expectedSymbols.count)
            
            for j in 0..<actualSymbols.count {
                XCTAssertEqual(actualSymbols[j].0, expectedSymbols[j].0)
                XCTAssertEqual(actualSymbols[j].1, expectedSymbols[j].1)
            }
        }
    }
    
    func testGetNumbersWithAdjacentSymbols() throws {
        let lines = Line.buildLinesWithPreviousAndNext(linesInput: linesInput)
        
        for i in 0..<linesInput.count {
            let line = lines[i]
            let expectedNumbers = numbersWithAdjacentSymbols[i]
            
            XCTAssertEqual(line.getNumbersWithAdjacentSymbols(), expectedNumbers)
        }
    }
    
    func testSum() throws {
        var sum = 0
        
        let lines = Line.buildLinesWithPreviousAndNext(linesInput: linesInput)
        
        for i in 0..<linesInput.count {
            let line = lines[i]
            for number in line.getNumbersWithAdjacentSymbols() {
                sum += number
            }
        }
        
        XCTAssertEqual(sum, 4361)
    }
    
    func testGetGearRatios() throws {
        let lines = Line.buildLinesWithPreviousAndNext(linesInput: linesInput)
        
        var gearRatios = [Int]()
        
        for line in lines {
            for gearRatio in line.getGearRatios() {
                gearRatios.append(gearRatio)
            }
        }
        
        XCTAssertEqual(gearRatios.reduce(0, +), 467835)
    }
}
