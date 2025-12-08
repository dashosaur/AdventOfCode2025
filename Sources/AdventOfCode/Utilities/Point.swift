//  Point.swift
//  AdventOfCode
//
//  Created by Dash on 12/11/20.
//

import Foundation
import Algorithms

infix operator %%: MultiplicationPrecedence
func %%<T: BinaryInteger>(lhs: T, rhs: T) -> T {
    return (lhs % rhs + rhs) % rhs
}

struct Point: Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    init(_ string: String) {
        let split = string.split(separator: ",")
        self.x = Int(split[0])!
        self.y = Int(split[1])!
    }
    
    static let origin = Point(0, 0)
    
    static let unitVectors = [Point(0, 1), Point(1, 0), Point(0, -1), Point(-1, 0)]
    static let unitDiagnonalVectors = [Point(1, 1), Point(1, -1), Point(-1, 1), Point(-1, -1)]
    static let allUnitVectors: [Point] = unitVectors + unitDiagnonalVectors
    
    var neighbors: [Point] {
        Self.unitVectors.map { self + $0 }
    }
    
    var allNeighbors: [Point] {
        (Self.unitVectors + Self.unitDiagnonalVectors).map { self + $0 }
    }
    
    static func +(lhs: Point, rhs: Point) -> Point {
        Point(lhs.x + rhs.x, lhs.y + rhs.y)
    }
    
    static func += (lhs: inout Point, rhs: Point) {
        lhs = lhs + rhs
    }
    
    static func -(lhs: Point, rhs: Point) -> Point {
        Point(lhs.x - rhs.x, lhs.y - rhs.y)
    }
    
    static func -= (lhs: inout Point, rhs: Point) {
        lhs = lhs - rhs
    }
    
    static func *(value: Int, point: Point) -> Point {
        Point(point.x * value, point.y * value)
    }
    
    func rotate(turns: Int) -> Point {
        (0..<(turns %% 4)).reduce(self) { p, _ in Point(p.y, -p.x) }
    }
    
    func turnRight() -> Point {
        rotate(turns: 3)
    }
    
    func turnLeft() -> Point {
        rotate(turns: 1)
    }
    
    var manhattanDistance: Int {
        abs(x) + abs(y)
    }
    
    func manhattanDistance(to other: Point) -> Int {
        abs(other.x - x) + abs(other.y - y)
    }
}

extension Point: CustomStringConvertible {
    var description: String {
        "(\(x),\(y))"
    }
}

extension Collection where Index == Int, Element : Collection, Element.Index == Int {
    subscript(point: Point) -> Element.Element? {
        guard (0..<count).contains(point.y) else { return nil }
        guard (0..<self[point.y].count).contains(point.x) else { return nil }
        return self[point.y][point.x]
    }
    
    var points: [Point] {
        guard !isEmpty else { return [] }
        return product((0..<self[0].count), (0..<count))
            .map { Point($0.0, $0.1) }
    }
}

// MARK: - 3D Points

struct Point3D: Hashable {
    var x: Int
    var y: Int
    var z: Int
    
    init(_ x: Int, _ y: Int, _ z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    init(_ string: String) {
        let split = string.integers
        self.x = split[0]
        self.y = split[1]
        self.z = split[2]
    }
    
    static let origin = Point3D(0, 0, 0)
    
    static let unitVectors = [Point3D(0, 0, 1), Point3D(0, 1, 0), Point3D(1, 0, 0), Point3D(0, 0, -1), Point3D(0, -1, 0), Point3D(-1, 0, 0)]

    var neighbors: [Point3D] {
        Self.unitVectors.map { self + $0 }
    }
    
    static func +(lhs: Point3D, rhs: Point3D) -> Point3D {
        Point3D(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
    }
    
    static func += (lhs: inout Point3D, rhs: Point3D) {
        lhs = lhs + rhs
    }
    
    static func -(lhs: Point3D, rhs: Point3D) -> Point3D {
        Point3D(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - rhs.z)
    }
    
    static func -= (lhs: inout Point3D, rhs: Point3D) {
        lhs = lhs - rhs
    }
    
    static func *(value: Int, point: Point3D) -> Point3D {
        Point3D(point.x * value, point.y * value, point.z * value)
    }

    var manhattanDistance: Int {
        abs(x) + abs(y) + abs(z)
    }

    func manhattanDistance(to other: Point3D) -> Int {
        abs(other.x - x) + abs(other.y - y) + abs(other.z - z)
    }
    
    func euclideanDistance(to other: Point3D) -> Double {
        sqrt(Double(pow((other.x - x), 2) + pow((other.y - y), 2) + pow((other.z - z), 2)))
    }
}
