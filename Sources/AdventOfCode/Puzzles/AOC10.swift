//  AOC10.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation
import Algorithms

struct AOC10: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        func minimumPressesToReachLightsOn(_ targetLightsOn: Set<Int>, initialLightsOn: Set<Int> = [], buttons: [[Int]]) -> Int? {
            var queue: [(currentLights: Set<Int>, presses: Int)] = [(initialLightsOn, 0)]
            var visited: Set<Set<Int>> = [initialLightsOn]
            
            while !queue.isEmpty {
                let (currentLights, presses) = queue.removeFirst()
                
                for button in buttons {
                    let next = currentLights.toggle(button)
                    if visited.contains(next) { continue }
                    visited.insert(next)
                    
                    if next == targetLightsOn {
                        return presses + 1
                    }
                    
                    queue.append((next, presses + 1))
                }
            }
            
            return nil
        }
        
        return input.lines.reduceSum { line in
            let buttons = line.components(separatedBy: " ").dropFirst().dropLast().map { buttonText in
                String(buttonText.dropFirst().dropLast()).integers
            }
            
            let targetLightsOn = Set(line.components(separatedBy: " ")[0].dropFirst().dropLast().enumerated().compactMap { index, character in
                if character == "#" {
                    return index
                }
                return nil
            })
            return minimumPressesToReachLightsOn(targetLightsOn, buttons: buttons)!
        }
    }
    
    func solve2(input: String) -> Int {
        0
    }
}
