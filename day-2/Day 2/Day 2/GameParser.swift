//
//  LineParser.swift
//  Day 2
//
//  Created by Sören Kuklau on 02.12.23.
//

import Foundation

struct GameParser {
    static func parse(line: String) -> Game {
        let regex = /Game (?<GameId>\d+): (?<Rounds>((\d+ (blue|red|green)(, )?)+(; )?)+)/

        var gameId: Int

        let match = line.firstMatch(of: regex)!
        gameId = Int(match.output.GameId)!

        var rounds = [Round]()

        for round in match.output.Rounds.split(separator: ";") {
            let result = RoundParser.parse(snippet: String(round))
            rounds.append(result)
        }

        return Game(id: gameId, rounds: rounds)
    }
}
