//  Set.swift
//  AdventOfCode
//
//  Created by Dash on 12/10/25.
//

extension Set<Int> {
    func toggle(_ index: Int) -> Self {
        var result = self
        if result.contains(index) {
            result.remove(index)
        } else {
            result.insert(index)
        }
        return result
    }
    
    func toggle<S>(_ other: S) -> Set<Element> where Element == S.Element, S : Sequence {
        var result = self
        for index in other {
            result = result.toggle(index)
        }
        return result
    }
}
