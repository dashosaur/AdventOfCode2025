//
//  PuzzleTests.swift
//  AdventOfCodeTests
//
//  Created by Dash on 11/29/20.
//

import Testing

struct PuzzleTests {
    
    @Test
    func puzzleExample() {
        #expect(Example().solve1(input: "12,16") == 5)
        #expect(Example().solve2(input: "100756") == 50346)
    }
    
    @Test
    func puzzle1() {
        let puzzle = AOC1()
        
        let input1 = """
        L68
        L30
        R48
        L5
        R60
        L55
        L1
        L99
        R14
        L82
        """
        
        #expect(puzzle.solve1(input: input1) == 3)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 6)
    }
    
    @Test
    func testAOC2() {
        let puzzle = AOC2()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func testAOC3() {
        let puzzle = AOC3()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func testAOC4() {
        let puzzle = AOC4()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func testAOC5() {
        let puzzle = AOC5()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func testAOC6() {
        let puzzle = AOC6()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func testAOC7() {
        let puzzle = AOC7()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func testAOC8() {
        let puzzle = AOC8()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func testAOC9() {
        let puzzle = AOC9()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func puzzle10() {
        let puzzle = AOC10()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func puzzle11() {
        let puzzle = AOC11()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func puzzle12() {
        let puzzle = AOC12()
        
        let input1 = """
        """
        
        #expect(puzzle.solve1(input: input1) == 0)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
}
