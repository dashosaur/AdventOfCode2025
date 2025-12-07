//  AOC7.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation
import Algorithms

struct AOC7: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        let grid = input.characterGrid
        let start = grid.points.first(where: { grid[$0] == "S" })!
        
        var splitCount = 0
        var beamLocations = Set<Point>([start])
        while !beamLocations.isEmpty {
            var nextLocations = Set<Point>()
            for location in beamLocations {
                let nextLocation = location + .init(0, 1)
                if grid[nextLocation] == "^" {
                    nextLocations.insert(nextLocation - .init(1, 0))
                    nextLocations.insert(nextLocation + .init(1, 0))
                    splitCount += 1
                } else if grid[nextLocation] == "." {
                    nextLocations.insert(nextLocation)
                }
            }
            beamLocations = nextLocations
        }
        
        return splitCount
    }
    
    func solve2(input: String) -> Int {
        let grid = input.characterGrid
        let start = grid.points.first(where: { grid[$0] == "S" })!
        
        var timelineCountCache = [Point: Int]()
        func countTimelinesFromBeamLocation(_ beamLocation: Point) -> Int {
            if let cachedCount = timelineCountCache[beamLocation] { return cachedCount }
            let nextLocation = beamLocation + .init(0, 1)
            
            let count: Int
            if grid[nextLocation] == "^" {
                count = countTimelinesFromBeamLocation(nextLocation - .init(1, 0)) + countTimelinesFromBeamLocation(nextLocation + .init(1, 0))
            } else if grid[nextLocation] == "." {
                count = countTimelinesFromBeamLocation(nextLocation)
            } else {
                count = 1
            }
            timelineCountCache[beamLocation] = count
            return count
        }
        
        return countTimelinesFromBeamLocation(start)
    }
}
