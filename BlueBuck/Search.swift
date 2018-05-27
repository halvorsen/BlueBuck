//
//  Search.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/27/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

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
    }
    internal func patterns(_ patterns: [Pattern]) -> [(pattern: Pattern, blocks: [Block])] {
        findPrimativePairs()
        var response: [(pattern: Pattern, blocks: [Block])] = []
        for pattern in patterns {
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
        default:
            break
        }
        
        return foundPatterns
    }
    
    private func findFalcon() -> [[Block]] {
        var foundPatterns: [[Block]] = []
        print("--------")
        for primative in primativePairIndexes {
            print("primative")
            print(primative)
            if let block1 = dictionary[primative.row - 1]?[primative.column],
                let block2 = dictionary[primative.row + 1]?[primative.column],
                let block3 = dictionary[primative.row]?[primative.column - 1] {
                print("entered guards:\(primative.block.blockType),\(block1.blockType),\(block2.blockType),\(block3.blockType)")
                if (primative.block.blockType == block1.blockType) && (block2.blockType == block3.blockType) {
                    if primative.block.blockType == block2.blockType {
                        print("entered equals")
                        foundPatterns.append([primative.block, block1, block2, block3])
                    }
                }
            }
            
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
}
