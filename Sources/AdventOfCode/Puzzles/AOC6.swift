//  AOC6.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation
import Algorithms

struct AOC6: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        let operandRows = input.lines.dropLast().map(\.integers)
        let operators = input.lines.last!.componentStrings
        
        return (0..<operandRows[0].count).reduceSum { columnIndex in
            operandRows.map({ $0[columnIndex] }).reduceWithOperator(operators[columnIndex])
        }
    }
    
    func solve2(input: String) -> Int {
        let grid = input.characterGrid
        
        var total = 0
        var numbers: [Int] = []
        
        for columnIndex in (0..<input.lines[0].count).reversed() {
            let digits = grid.dropLast().compactMap { $0[columnIndex].nilIfEmpty }
            guard let number = Int(String(digits)) else { continue }
            numbers.append(number)
            
            if let operatorCharacter = grid.last![columnIndex].nilIfEmpty {
                total += numbers.reduceWithOperator(String(operatorCharacter))
                numbers = []
            }
        }
        
        return total
    }
}

private extension [Int] {
    func reduceWithOperator(_ operator: String) -> Int {
        switch `operator` {
        case "+":
            reduce(0, +)
        case "*":
            reduce(1, *)
        default:
            fatalError()
        }
    }
}

private extension Character {
    var nilIfEmpty: Character? {
        self == " " ? nil : self
    }
}
