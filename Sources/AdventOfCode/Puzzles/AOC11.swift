//  AOC11.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation
import Algorithms

struct AOC11: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        let connections: [String: [String]] = input.lines.reduce(into: [:]) { connections, line in
            let (input, outputs) = line.splitInTwo(": ")
            connections[input] = outputs.componentStrings
        }
        
        func countPaths(from: String, to: String) -> Int {
            if from == to { return 1 }
            
            return connections[from, default: []].reduceSum { next in
                countPaths(from: next, to: to)
            }
        }
        
        return countPaths(from: "you", to: "out")
    }
    
    func solve2(input: String) -> Int {
        let connections: [String: [String]] = input.lines.reduce(into: [:]) { connections, line in
            let (input, outputs) = line.splitInTwo(": ")
            connections[input] = outputs.componentStrings
        }
        
        struct State: Hashable {
            let from: String
            let didVisitDAC: Bool
            let didVisitFFT: Bool
        }
        
        var cache: [State: Int] = [:]
        func countPaths(from: String, to: String, didVisitDAC: Bool = false, didVisitFFT: Bool = false) -> Int {
            if from == to { return (didVisitDAC && didVisitFFT) ? 1 : 0 }
            
            let cacheKey = State(from: from, didVisitDAC: didVisitDAC, didVisitFFT: didVisitFFT)
            if let cachedCount = cache[cacheKey] { return cachedCount }
            
            let count = connections[from, default: []].reduceSum { next in
                countPaths(
                    from: next,
                    to: to,
                    didVisitDAC: didVisitDAC || (next == "dac"),
                    didVisitFFT: didVisitFFT || (next == "fft")
                )
            }
            
            cache[cacheKey] = count
            return count
        }
        
        return countPaths(from: "svr", to: "out")
    }
}
