//  PuzzleSet.swift
//  AdventOfCode
//
//  Created by Dash on 12/2/20.
//

import Foundation

protocol Puzzle<Answer> {
    associatedtype Answer
    func solve1(input: String) -> Answer
    func solve2(input: String) -> Answer
}

struct PuzzleSet {
    private let puzzlesByIndex: [Int : any Puzzle] = [
        0 : Example(),
        1 : AOC1(),
        2 : AOC2(),
        3 : AOC3(),
        4 : AOC4(),
        5 : AOC5(),
        6 : AOC6(),
        7 : AOC7(),
        8 : AOC8(),
        9 : AOC9(),
        10 : AOC10(),
        11 : AOC11(),
        12 : AOC12(),
    ]
    
    func puzzle(at index: Int) -> (any Puzzle)? {
        puzzlesByIndex[index]
    }
    
    var supportedPuzzleIndexes: [Int] {
        Array(puzzlesByIndex.keys).sorted()
    }
}
