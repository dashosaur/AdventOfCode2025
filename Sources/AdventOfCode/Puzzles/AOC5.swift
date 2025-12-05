//  AOC5.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation

struct AOC5: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        input.lineGroups[0].lines
            .reduce(into: IndexSet()) { $0.insert(integersIn: $1.range) }
            .intersection(IndexSet(indexes: input.lineGroups[1].integers))
            .count
    }
    
    func solve2(input: String) -> Int {
        input.lineGroups[0].lines
            .reduce(into: IndexSet(), { $0.insert(integersIn: $1.range) })
            .count
    }
}
