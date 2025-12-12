//  AOC9.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation
import Algorithms

struct AOC9: Puzzle {
    typealias Answer = Int
    
    private func area(corner1: Point, corner2: Point) -> Int {
        (abs(corner1.x - corner2.x) + 1) * (abs(corner1.y - corner2.y) + 1)
    }
    
    func solve1(input: String) -> Int {
        let points = input.lines.map({ Point($0) })
        
        let areas = product(points, points).map { (corner1, corner2) in
            area(corner1: corner1, corner2: corner2)
        }
        
        return areas.max()!
    }
    
    func solve2(input: String) -> Int {
        let points = input.lines.map({ Point($0) })
        
        let xs = points.map(\.x).uniqued().sorted()
        let ys = points.map(\.y).uniqued().sorted()
        let compressedPoints = points.map { point in
            Point(xs.firstIndex(of: point.x)!, ys.firstIndex(of: point.y)!)
        }
        
        let indexByPoint = points.enumerated().reduce(into: [Point: Int]()) { $0[$1.element] = $1.offset }
        let rectangles = product(points, points).map { (p1, p2) in
            (
                original: (corner1: p1, corner2: p2),
                compressed: (corner1: compressedPoints[indexByPoint[p1]!], corner2: compressedPoints[indexByPoint[p2]!])
            )
        }
        
        let areas = rectangles.map { rectangle in
            area(corner1: rectangle.original.corner1, corner2: rectangle.original.corner2)
        }
        
        var insidePoints = Set<Point>()
        for (point1, point2) in zip(compressedPoints, compressedPoints.dropFirst() + [compressedPoints.first!]) {
            let distance = point1.manhattanDistance(to: point2)
            let step = Point((point2 - point1).x / distance, (point2 - point1).y / distance)
            
            for offset in 0...distance {
                insidePoints.insert(point1 + offset * step)
            }
        }
        
        // flood fill to add all inside points
        var queue: [Point] = [.init(xs.count / 2, ys.count / 2)]
        var visited: Set<Point> = []
        while !queue.isEmpty {
            let next = queue.removeFirst()
            insidePoints.insert(next)
            
            for neighbor in next.neighbors {
                if !insidePoints.contains(neighbor), !visited.contains(neighbor) {
                    queue.append(neighbor)
                    visited.insert(neighbor)
                }
            }
        }
        
        let validAreas = rectangles.enumerated().compactMap { (rectangleIndex, rectangle) in
            let (corner1, corner2) = rectangle.compressed
            let allPoints = product(ClosedRange(bound1: corner1.x, bound2: corner2.x), ClosedRange(bound1: corner1.y, bound2: corner2.y))
            return allPoints.allSatisfy({ insidePoints.contains(.init($0.0, $0.1)) }) ? areas[rectangleIndex] : nil
        }
        return validAreas.max()!
    }
}
