//  AOC9.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation
import Algorithms

struct AOC9: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        let points = input.lines.map({ Point($0) })
        
        var maxArea = Int.min
        for p1 in points {
            for p2 in points {
                let area = abs(p1.x - p2.x + 1) * abs(p1.y - p2.y + 1)
                if area > maxArea {
                    maxArea = area
                }
            }
        }
        
        return maxArea
    }
    
    func solve2(input: String) -> Int {
        0
    }
}
