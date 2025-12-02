//  AOC2.swift
//  AdventOfCode
//
//  Created by Dash on 11/30/25.
//

import Foundation
import Algorithms

struct AOC2: Puzzle {
    typealias Answer = Int
    
    func solve1(input: String) -> Int {
        input.componentStrings.reduceSum { rangeText in
            rangeText.range.reduceSum { number in
                number.hasDuplicatedDigits ? number : 0
            }
        }
    }
    
    func solve2(input: String) -> Int {
        input.componentStrings.reduceSum { rangeText in
            rangeText.range.reduceSum { number in
                number.hasRepeatingDigits ? number : 0
            }
        }
    }
}

extension Int {
    var hasDuplicatedDigits: Bool {
        let text = String(self)
        return text[0..<(text.count/2)] == text[(text.count/2)..<text.count]
    }
    
    var hasRepeatingDigits: Bool {
        let text = String(self)
        for chunkSize in 1..<(text.count/2 + 1) {
            guard text.count % chunkSize == 0 else { continue }
            let chunks = text.chunks(ofCount: chunkSize)
            if chunks.count > 1, chunks.allSatisfy({ $0 == chunks.first }) {
                return true
            }
        }
        return false
    }
}
