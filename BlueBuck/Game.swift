//
//  Game.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/13/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//
import SpriteKit

internal protocol GameDelegate: class {
    func updateView()
}

internal let color : [BlockType: UIColor] = [
    .white: Color.white,
    .blue: Color.blue,
    .green: Color.green,
    .pink: Color.pink,
    .yellow: Color.yellow
    
]

internal final class Game {
    
    internal var delegate: GameDelegate?
    private(set) internal var originalAllBlocks: [Block]
    private(set) internal var blockQueue: [Block]
    private(set) internal var currentBoard: [[Block]] = [[]]
    private(set) internal var gameOrientation: DeviceDirection = .up
    private(set) internal var buttonsVisible: Bool = false
    private(set) internal var locations : [[CGPoint]] = [[]]
    private var queueIndex = 50
    
    init(blocks: [Block]) {
        self.originalAllBlocks = blocks
        self.blockQueue = blocks
        
        for i in 0..<10 {
            var newRow : [CGPoint] = []
            var rowBlocks : [Block] = []
            for j in 0..<5 {
                let newLocation = CGPoint(x: 91.5 + 48*CGFloat(j), y: 549 - 48*CGFloat(i))
                newRow.append(newLocation)
                let index = 5*i + j
                blocks[index].shapeNode.lineWidth = 5
                if originalAllBlocks.count > (index),
                    let color = color[blocks[index].blockType] {
                    blocks[index].shapeNode.strokeColor = color
                }
                blocks[index].shapeNode.lineJoin = .miter

                blocks[index].shapeNode.position = newLocation
                rowBlocks.append(blocks[index])
            }
            currentBoard.append(rowBlocks)
            locations.append(newRow)
        }
        
    }
    
    internal func currentQueueIndexAndIncrement() -> Int {
        let index = queueIndex%100
        queueIndex += 1
        return index
    }
    
    internal func tap(block: Block) {
        
    }
    
    internal func movedDevice() {
        
    }
    
    internal func toggledButtons() {
        
    }
    
    
    
}
