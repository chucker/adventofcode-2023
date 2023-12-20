//
//  Range.swift
//  Day 5 Tests
//
//  Created by Sören Kuklau on 20.12.23.
//

import Foundation

struct Range {
    let destinationStart: Int
    lazy var destinationEnd: Int = destinationStart + length - 1

    let sourceStart: Int
    lazy var sourceEnd: Int = sourceStart + length - 1

    let length: Int
}
