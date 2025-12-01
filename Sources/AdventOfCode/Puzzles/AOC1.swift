//  AOC1.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation

struct AOC1: Puzzle {
    typealias Answer = Int
    
    func solve(input: String, countCrossings: Bool = false) -> Int {
        var location = 50
        var count = 0
        
        for line in input.lines {
            let direction = line.first == "L" ? -1 : 1
            var distance = Int(line.dropFirst())!
            
            if countCrossings {
                count += distance / 100
                distance %= 100
            }
            
            let newLocationTemp = location + direction * distance
            let newLocation = (newLocationTemp + 100) % 100
            let crossedZero = newLocation != newLocationTemp && location != 0
            if newLocation == 0 || (countCrossings && crossedZero) {
                count += 1
            }
            location = newLocation
        }
        
        return count
    }
    
    func solve1(input: String) -> Int {
        solve(input: input)
    }
    
    func solve2(input: String) -> Int {
        solve(input: input, countCrossings: true)
    }
}
