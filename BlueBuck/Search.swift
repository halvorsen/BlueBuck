//
//  Search.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

/*
 
 horizontal pairs searched first
 ◻️ ◻️
 
 patterns searched from the left of the two squares of the pairs found
 ◻️ ◻️ ◻️
 ◻️
 
 */

import Foundation

internal final class Search {
    private var blocks: [Block] = []
    private var dictionary: [Int: [Int: Block]] = [
        1: [:], 2: [:], 3: [:], 4: [:], 5: [:], 6: [:], 7: [:], 8: [:], 9: [:], 10: [:]
    ]// Dictionary of rows, Dictionary of blocks
    private var primativePairIndexes: [(row: Int, column: Int, block: Block)] = []
    
    init(_ blocks: [Block]) {
        for block in blocks {
            let row = block.location.row
            let column = block.location.column
            dictionary[row]![column] = block
        }
        if let dict = dictionary[10],
        dict.count < 5 {
            print("ERROR!")
            print("10")
            print(dict.count)
            print(dict)
        }
        if let dict = dictionary[1],
            dict.count < 5 {
            print("ERROR!")
            print("1")
            print(dict.count)
            print(dict)
            print(blocks.count)
            for block in blocks {
                print(block.location)
            }
        }
        if let dict = dictionary[2],
            dict.count < 5 {
            print("ERROR!")
            print("2")
            print(dict.count)
            print(dict)
        }
        if let dict = dictionary[3],
            dict.count < 5 {
            print("ERROR!")
            print("3")
            print(dict.count)
            print(dict)
        }
        if let dict = dictionary[4],
            dict.count < 5 {
            print("ERROR!")
            print("4")
            print(dict.count)
            print(dict)
        }
        if let dict = dictionary[5],
            dict.count < 5 {
            print("ERROR!")
            print("5")
            print(dict.count)
            print(dict)
        }
        if let dict = dictionary[6],
            dict.count < 5 {
            print("ERROR!")
            print("6")
            print(dict.count)
            print(dict)
        }
        if let dict = dictionary[7],
            dict.count < 5 {
            print("ERROR!")
            print("7")
            print(dict.count)
            print(dict)
        }
        if let dict = dictionary[8],
            dict.count < 5 {
            print("ERROR!")
            print("8")
            print(dict.count)
            print(dict)
        }
        if let dict = dictionary[9],
            dict.count < 5 {
            print("ERROR!")
            print("9")
            print(dict.count)
            print(dict)
        }
        
       
    }
    internal func patterns(_ patterns: [Pattern]) -> [(pattern: Pattern, blocks: [Block])] {
        findPrimativePairs()
        var response: [(pattern: Pattern, blocks: [Block])] = []
        let sortedPatterns = patterns.sorted { ObjectiveModel.patternData[$0]!.filter{ $0 == true }.count > ObjectiveModel.patternData[$1]!.filter{ $0 == true }.count}
        for pattern in sortedPatterns {
            let blocks = find(pattern: pattern)
            for set in blocks {
                response.append((pattern: pattern, blocks: set))
            }
            
        }
        return response
    }
    
    
    private func find(pattern: Pattern) -> [[Block]] {
        var foundPatterns: [[Block]] = []
        switch pattern {
        case .falcon:
            foundPatterns = findFalcon()
        case .armadillo1:
            foundPatterns = findArmadillo1()
        case .armadillo2:
            foundPatterns = findArmadillo2()
        case .bat1:
            foundPatterns = findBat1()
        case .bat2:
            foundPatterns = findBat2()
        case .bat3:
            foundPatterns = findBat3()
        case .bat4:
            foundPatterns = findBat4()
        case .elephant:
            foundPatterns = findElephant()
        case .giraffe1:
            foundPatterns = findGiraffe1()
        case .giraffe2:
            foundPatterns = findGiraffe2()
        case .giraffe3:
            foundPatterns = findGiraffe3()
        case .giraffe4:
            foundPatterns = findGiraffe4()
        case .goat1:
            foundPatterns = findGoat1()
        case .goat2:
            foundPatterns = findGoat2()
        case .goat3:
            foundPatterns = findGoat3()
        case .goat4:
            foundPatterns = findGoat4()
        case .goose1:
            foundPatterns = findGoose1()
        case .goose2:
            foundPatterns = findGoose2()
        case .goose3:
            foundPatterns = findGoose3()
        case .goose4:
            foundPatterns = findGoose4()
        case .monkey:
            foundPatterns = findMonkey()
        case .mouse:
            foundPatterns = findMouse()
        case .ram1:
            foundPatterns = findRam1()
        case .ram2:
            foundPatterns = findRam2()
        case .rino1:
            foundPatterns = findRino1()
        case .rino2:
            foundPatterns = findRino2()
        case .rino3:
            foundPatterns = findRino3()
        case .rino4:
            foundPatterns = findRino4()
        case .stag1:
            foundPatterns = findStag1()
        case .stag2:
            foundPatterns = findStag2()
        case .stag3:
            foundPatterns = findStag3()
        case .stag4:
            foundPatterns = findStag4()
        case .turtle1:
            foundPatterns = findTurtle1()
        case .turtle2:
            foundPatterns = findTurtle2()
        case .turtle3:
            foundPatterns = findTurtle3()
        case .turtle4:
            foundPatterns = findTurtle4()
        }
        
        return foundPatterns
    }
    
    private func findPrimativePairs() {
        for rowIndex in 1...10 {
            var previousBlock: Block?
            for columnIndex in 1...5 {
                if let previous = previousBlock {
                    if dictionary[rowIndex]![columnIndex]!.blockType == previous.blockType {
                        primativePairIndexes.append((row: rowIndex, column: columnIndex - 1, block: previous))
                    }
                }
                previousBlock = dictionary[rowIndex]![columnIndex]!
                
            }
        }
    }
    private func findFalcon() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column],
                let block2 = dictionary[primative.row + 1]?[primative.column],
                let block3 = dictionary[primative.row]?[primative.column - 1] {
                
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
            
        }
        return foundPatterns
    }
    private func findArmadillo1() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column],
                let block2 = dictionary[primative.row - 1]?[primative.column + 1],
                let block3 = dictionary[primative.row - 1]?[primative.column + 2],
                let block4 = dictionary[primative.row]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4])
                }
            }
        }
        return foundPatterns
    }
    private func findArmadillo2() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column],
                let block2 = dictionary[primative.row - 2]?[primative.column],
                let block3 = dictionary[primative.row - 1]?[primative.column + 1],
                let block4 = dictionary[primative.row - 2]?[primative.column + 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4])
                }
            }
        }
        return foundPatterns
    }
    private func findBat1() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column + 1],
                let block2 = dictionary[primative.row + 1]?[primative.column],
                let block3 = dictionary[primative.row + 1]?[primative.column + 1],
                let block4 = dictionary[primative.row + 1]?[primative.column - 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4])
                }
            }
        }
        return foundPatterns
    }
    private func findBat2() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column],
                let block2 = dictionary[primative.row + 1]?[primative.column],
                let block3 = dictionary[primative.row + 1]?[primative.column + 1],
                let block4 = dictionary[primative.row + 1]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4])
                }
            }
        }
        return foundPatterns
    }
    private func findBat3() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row + 1]?[primative.column + 1],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block3 = dictionary[primative.row - 1]?[primative.column + 1],
                let block4 = dictionary[primative.row - 1]?[primative.column - 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4])
                }
            }
        }
        return foundPatterns
    }
    private func findBat4() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row + 1]?[primative.column],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block3 = dictionary[primative.row - 1]?[primative.column + 1],
                let block4 = dictionary[primative.row - 1]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4])
                }
            }
        }
        return foundPatterns
    }
    private func findElephant() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block3 = dictionary[primative.row - 1]?[primative.column + 1],
                let block4 = dictionary[primative.row - 1]?[primative.column + 2],
                let block5 = dictionary[primative.row - 2]?[primative.column],
                let block6 = dictionary[primative.row - 2]?[primative.column + 1],
                let block7 = dictionary[primative.row - 2]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType, block5.blockType, block6.blockType, block7.blockType].allEqual() {
                    if block6.blockType == .blue {
                        
                        NotificationCenter.default.post(name: Notification.Name("FoundBuck"), object: nil)
                    }
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4, block5, block6, block7])
                }
            }
        }
        return foundPatterns
    }
    private func findGiraffe1() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column + 1],
                let block2 = dictionary[primative.row - 2]?[primative.column + 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2])
                }
            }
        }
        return foundPatterns
    }
    private func findGiraffe2() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column],
                let block2 = dictionary[primative.row - 2]?[primative.column] {
                if [primative.block.blockType, block1.blockType, block2.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2])
                }
            }
        }
        return foundPatterns
    }
    private func findGiraffe3() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2])
                }
            }
        }
        return foundPatterns
    }
    private func findGiraffe4() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row + 1]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2])
                }
            }
        }
        return foundPatterns
    }
    private func findGoat1() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block3 = dictionary[primative.row - 1]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findGoat2() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row + 1]?[primative.column],
                let block3 = dictionary[primative.row + 1]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findGoat3() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column],
                let block2 = dictionary[primative.row - 2]?[primative.column],
                let block3 = dictionary[primative.row - 2]?[primative.column + 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findGoat4() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column + 1],
                let block2 = dictionary[primative.row - 2]?[primative.column + 1],
                let block3 = dictionary[primative.row - 2]?[primative.column] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findGoose1() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row + 1]?[primative.column + 2],
                let block3 = dictionary[primative.row + 2]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findGoose2() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row + 1]?[primative.column],
                let block3 = dictionary[primative.row + 2]?[primative.column] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findGoose3() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block3 = dictionary[primative.row - 2]?[primative.column] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findGoose4() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column + 2],
                let block3 = dictionary[primative.row - 2]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findMonkey() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block4 = dictionary[primative.row - 1]?[primative.column + 2],
                let block5 = dictionary[primative.row - 2]?[primative.column],
                let block6 = dictionary[primative.row - 2]?[primative.column + 1],
                let block7 = dictionary[primative.row - 2]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block4.blockType, block5.blockType, block6.blockType, block7.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block4, block5, block6, block7])
                }
            }
        }
        return foundPatterns
    }
    private func findMouse() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column + 1],
                let block2 = dictionary[primative.row - 1]?[primative.column] {
                if [primative.block.blockType, block1.blockType, block2.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2])
                }
            }
        }
        return foundPatterns
    }
    private func findRam1() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column + 1],
                let block3 = dictionary[primative.row - 2]?[primative.column],
                let block4 = dictionary[primative.row - 2]?[primative.column + 1],
                let block5 = dictionary[primative.row - 2]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType, block5.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4, block5])
                }
            }
        }
        return foundPatterns
    }
    private func findRam2() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block3 = dictionary[primative.row + 1]?[primative.column],
                let block4 = dictionary[primative.row - 1]?[primative.column + 2],
                let block5 = dictionary[primative.row + 1]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType, block5.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4, block5])
                }
            }
        }
        return foundPatterns
    }
    private func findRino1() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column + 1],
                let block3 = dictionary[primative.row - 2]?[primative.column + 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findRino2() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row + 1]?[primative.column + 1],
                let block3 = dictionary[primative.row + 2]?[primative.column + 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findRino3() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column + 2],
                let block3 = dictionary[primative.row + 1]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findRino4() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block3 = dictionary[primative.row + 1]?[primative.column] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3])
                }
            }
        }
        return foundPatterns
    }
    private func findStag1() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block3 = dictionary[primative.row - 2]?[primative.column],
                let block4 = dictionary[primative.row - 1]?[primative.column + 2],
                let block5 = dictionary[primative.row - 2]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType, block5.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4, block5])
                }
            }
        }
        return foundPatterns
    }
    private func findStag2() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column],
                let block3 = dictionary[primative.row - 2]?[primative.column],
                let block4 = dictionary[primative.row - 2]?[primative.column + 1],
                let block5 = dictionary[primative.row - 2]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType, block5.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4, block5])
                }
            }
        }
        return foundPatterns
    }
    private func findStag3() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column + 2],
                let block3 = dictionary[primative.row - 2]?[primative.column],
                let block4 = dictionary[primative.row - 2]?[primative.column + 1],
                let block5 = dictionary[primative.row - 2]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType, block5.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4, block5])
                }
            }
        }
        return foundPatterns
    }
    private func findStag4() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row + 1]?[primative.column],
                let block3 = dictionary[primative.row + 2]?[primative.column],
                let block4 = dictionary[primative.row + 1]?[primative.column + 2],
                let block5 = dictionary[primative.row + 2]?[primative.column + 2] {
                if [primative.block.blockType, block1.blockType, block2.blockType, block3.blockType, block4.blockType, block5.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2, block3, block4, block5])
                }
            }
        }
        return foundPatterns
    }
    private func findTurtle1() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row - 1]?[primative.column + 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2])
                }
            }
        }
        return foundPatterns
    }
    private func findTurtle2() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row]?[primative.column + 2],
                let block2 = dictionary[primative.row + 1]?[primative.column + 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2])
                }
            }
        }
        return foundPatterns
    }
    private func findTurtle3() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column],
                let block2 = dictionary[primative.row + 1]?[primative.column] {
                if [primative.block.blockType, block1.blockType, block2.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2])
                }
            }
        }
        return foundPatterns
    }
    private func findTurtle4() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        for primative in primativePairIndexes {
            if let block0 = dictionary[primative.row]?[primative.column + 1],
                let block1 = dictionary[primative.row - 1]?[primative.column + 1],
                let block2 = dictionary[primative.row + 1]?[primative.column + 1] {
                if [primative.block.blockType, block1.blockType, block2.blockType].allEqual() {
                    foundPatterns.append([primative.block, block0, block1, block2])
                }
            }
        }
        return foundPatterns
    }
}

extension Array where Element : Equatable {
    func allEqual() -> Bool {
        if let firstElem = first {
            return !dropFirst().contains { $0 != firstElem }
        }
        return true
    }
}

