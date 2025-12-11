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
        11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
        1698522-1698528,446443-446449,38593856-38593862,565653-565659,
        824824821-824824827,2121212118-2121212124
        """
        
        #expect(puzzle.solve1(input: input1) == 1227775554)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 4174379265)
    }
    
    @Test
    func testAOC3() {
        let puzzle = AOC3()
        
        let input1 = """
        987654321111111
        811111111111119
        234234234234278
        818181911112111
        """
        
        #expect(puzzle.solve1(input: input1) == 357)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 3121910778619)
    }
    
    @Test
    func testAOC4() {
        let puzzle = AOC4()
        
        let input1 = """
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
        """
        
        #expect(puzzle.solve1(input: input1) == 13)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 43)
    }
    
    @Test
    func testAOC5() {
        let puzzle = AOC5()
        
        let input1 = """
        3-5
        10-14
        16-20
        12-18

        1
        5
        8
        11
        17
        32
        """
        
        #expect(puzzle.solve1(input: input1) == 3)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 14)
    }
    
    @Test
    func testAOC6() {
        let puzzle = AOC6()
        
        let input1 = """
        123 328  51 64 
         45 64  387 23 
          6 98  215 314
        *   +   *   +  
        """
        
        #expect(puzzle.solve1(input: input1) == 4277556)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 3263827)
    }
    
    @Test
    func testAOC7() {
        let puzzle = AOC7()
        
        let input1 = """
        .......S.......
        ...............
        .......^.......
        ...............
        ......^.^......
        ...............
        .....^.^.^.....
        ...............
        ....^.^...^....
        ...............
        ...^.^...^.^...
        ...............
        ..^...^.....^..
        ...............
        .^.^.^.^.^...^.
        ...............
        """
        
        #expect(puzzle.solve1(input: input1) == 21)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 40)
    }
    
    @Test
    func testAOC8() {
        let puzzle = AOC8()
        
        let input1 = """
        162,817,812
        57,618,57
        906,360,560
        592,479,940
        352,342,300
        466,668,158
        542,29,236
        431,825,988
        739,650,466
        52,470,668
        216,146,977
        819,987,18
        117,168,530
        805,96,715
        346,949,466
        970,615,88
        941,993,340
        862,61,35
        984,92,344
        425,690,689
        """
        
        #expect(puzzle.solve1(input: input1) == 40)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 25272)
    }
    
    @Test
    func testAOC9() {
        let puzzle = AOC9()
        
        let input1 = """
        7,1
        11,1
        11,7
        9,7
        9,5
        2,5
        2,3
        7,3
        """
        
        #expect(puzzle.solve1(input: input1) == 50)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func puzzle10() {
        let puzzle = AOC10()
        
        let input1 = """
        [.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
        [...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
        [.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
        """
        
        #expect(puzzle.solve1(input: input1) == 7)
        
        let input2 = input1
        
        #expect(puzzle.solve2(input: input2) == 0)
    }
    
    @Test
    func puzzle11() {
        let puzzle = AOC11()
        
        let input1 = """
        aaa: you hhh
        you: bbb ccc
        bbb: ddd eee
        ccc: ddd eee fff
        ddd: ggg
        eee: out
        fff: out
        ggg: out
        hhh: ccc fff iii
        iii: out
        """
        
        #expect(puzzle.solve1(input: input1) == 5)
        
        let input2 = """
        svr: aaa bbb
        aaa: fft
        fft: ccc
        bbb: tty
        tty: ccc
        ccc: ddd eee
        ddd: hub
        hub: fff
        eee: dac
        dac: fff
        fff: ggg hhh
        ggg: out
        hhh: out
        """
        
        #expect(puzzle.solve2(input: input2) == 2)
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
