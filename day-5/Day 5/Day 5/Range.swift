//
//  Range.swift
//  Day 5 Tests
//
//  Created by Sören Kuklau on 20.12.23.
//

import Foundation

struct Range: Equatable {
    let destinationStart: Int
    var destinationEnd: Int { destinationStart + length - 1 }

    let sourceStart: Int
    var sourceEnd: Int { sourceStart + length - 1 }

    let length: Int
}
