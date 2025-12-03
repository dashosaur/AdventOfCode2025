//  AOC3.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation

struct AOC3: Puzzle {
    typealias Answer = Int
    
    func solve(input: String, count: Int) -> Int {
        input.lines.reduceSum { bank in
            
            var batteries = bank.digitArray
            var selected = [Int]()
            
            for countRemaining in (0..<count).reversed() {
                let (maxBatteryIndex, maxBattery) = batteries.dropLast(countRemaining).enumerated().max(by: { $0.element < $1.element })!
                batteries.removeFirst(maxBatteryIndex + 1)
                selected.append(maxBattery)
            }
            
            return Int(selected.map({ String($0) }).joined())!
        }
    }
    
    func solve1(input: String) -> Int {
        solve(input: input, count: 2)
    }
    
    func solve2(input: String) -> Int {
        solve(input: input, count: 12)
    }
}
