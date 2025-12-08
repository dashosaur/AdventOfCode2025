//  AOC8.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation
import Algorithms

struct AOC8: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        let boxes = input.lines.map({ Point3D($0) })
        
        var boxPairs: [(distance: Double, box1: Point3D, box2: Point3D)] = []
        for i in 0..<boxes.count {
            for j in (i + 1)..<boxes.count {
                boxPairs.append((
                    distance: boxes[i].euclideanDistance(to: boxes[j]),
                    box1: boxes[i],
                    box2: boxes[j]
                ))
            }
        }
        boxPairs.sort { $0.distance < $1.distance }
        
        var circuits: [Set<Point3D>] = boxes.map({ Set([$0]) })
        
        for (_, box1, box2) in boxPairs[0..<(input.lines.count == 20 ? 10 : 1000)] {
            let c1i = circuits.firstIndex(where: { $0.contains(box1) })!
            let c2i = circuits.firstIndex(where: { $0.contains(box2) })!
            if c1i != c2i {
                circuits[c1i].formUnion(circuits[c2i])
                circuits.remove(at: c2i)
            }
        }
        
        return circuits.sorted(by: { $0.count > $1.count })[0..<3].reduceProduct({ $0.count })
    }
    
    func solve2(input: String) -> Int {
        let boxes = input.lines.map({ Point3D($0) })
        
        var boxPairs: [(distance: Double, box1: Point3D, box2: Point3D)] = []
        for i in 0..<boxes.count {
            for j in (i + 1)..<boxes.count {
                boxPairs.append((
                    distance: boxes[i].euclideanDistance(to: boxes[j]),
                    box1: boxes[i],
                    box2: boxes[j]
                ))
            }
        }
        boxPairs.sort { $0.distance < $1.distance }
        
        var circuits: [Set<Point3D>] = boxes.map({ Set([$0]) })
        
        for (_, box1, box2) in boxPairs {
            let c1i = circuits.firstIndex(where: { $0.contains(box1) })!
            let c2i = circuits.firstIndex(where: { $0.contains(box2) })!
            if c1i != c2i {
                circuits[c1i].formUnion(circuits[c2i])
                circuits.remove(at: c2i)
            }
            
            if circuits.count == 1 {
                return box1.x * box2.x
            }
        }
        
        fatalError()
    }
}
