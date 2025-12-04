//  AOC4.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation

struct AOC4: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        let grid = input.characterGrid
        return grid.points.count { grid.hasRollAtPoint($0) && grid.forkliftCanAccessPoint($0) }
    }
    
    func solve2(input: String) -> Int {
        var grid = input.characterGrid
        
        var keepRemoving = true
        while keepRemoving {
            keepRemoving = false
            
            for point in grid.points where grid.hasRollAtPoint(point) {
                if grid.forkliftCanAccessPoint(point) {
                    grid.removeRollAtPoint(point)
                    keepRemoving = true
                }
            }
        }
        
        return grid.removedRollCount
    }
}

private extension [[Character]] {
    func hasRollAtPoint(_ point: Point) -> Bool {
        self[point] == "@"
    }
    
    func forkliftCanAccessPoint(_ point: Point) -> Bool {
        point.allNeighbors.count(where: { self[$0] == "@" }) < 4
    }
    
    mutating func removeRollAtPoint(_ point: Point) {
        self[point.y][point.x] = "x"
    }
    
    var removedRollCount: Int {
        points.count(where: { self[$0] == "x" })
    }
}
