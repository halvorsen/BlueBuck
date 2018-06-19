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
    private(set) internal var allBlockType = [BlockType]()
    private(set) internal var blockQueue: [Block]
    private(set) internal var startBoard: [[Block]] = [[]]
    private(set) internal var gameOrientation: DeviceDirection = .up
    private(set) internal var buttonsVisible: Bool = false
    private var queueIndex = 0
    private(set) internal var level: BuckLevel?
    private(set) internal var blockConfigs: [BlockConfig]
    
    init(blocks: [Block], blockConfigs: [BlockConfig], level: BuckLevel) {
        self.level = level
        self.originalAllBlocks = blocks
        self.blockQueue = blocks
        self.blockConfigs = blockConfigs
        allBlockType = Levels.blockTypeArray[level]!
        for i in 0..<10 {
            var newRow : [CGPoint] = []
            var rowBlocks : [Block] = []
      
            for j in 0..<5 {
                let newLocation = CGPoint(x: 91.5 + 48*CGFloat(j), y: 549 - 48*CGFloat(i))
                newRow.append(newLocation)
                let index = 5*i + j
                rowBlocks.append(blocks[index])
            }
            startBoard.append(rowBlocks)
        }
        setShapeNodes()
        
    }
    
    internal func setShapeNodes() {
        for i in 0..<10 {
            for j in 0..<5 {
                let newLocation = CGPoint(x: 91.5 + 48*CGFloat(j), y: 549 - 48*CGFloat(i))
                let index = 5*i + j
                blockQueue[index].shapeNode.lineWidth = 5
                if originalAllBlocks.count > (index),
                    let color = color[blockQueue[index].blockType] {
                    blockQueue[index].shapeNode.strokeColor = color
                }
                blockQueue[index].shapeNode.lineJoin = .miter
                blockQueue[index].shapeNode.position = newLocation
            }
            
        }
        
        for k in 50..<55 {
            let newLocation = CGPoint(x: 56.5, y: 476.5 + (CGFloat(k) - 50)*21)
            blockQueue[k].shapeNode = SKShapeNode(rectOf: CGSize(width: 14, height: 14), cornerRadius: 0)
            blockQueue[k].shapeNode.lineWidth = 3
            if originalAllBlocks.count > k,
                let color = color[blockQueue[k].blockType] {
                blockQueue[k].shapeNode.strokeColor = color
            }
            blockQueue[k].shapeNode.lineJoin = .miter
            blockQueue[k].shapeNode.position = newLocation
        }
        for l in 55..<100 {
            blockQueue[l].shapeNode.position = CGPoint(x: 0.0, y: 0.0)
        }
    }
    
    internal func currentQueueIndex() -> Int {
        let index = queueIndex%100
        return index
    }
    
    internal func resetIndex() {
        queueIndex = 0
    }
    
    internal func incrementQueue(by amount: Int) {
        queueIndex += amount
    }
    
    static let centerLocation: [[CGPoint]] = [
        [
            CGPoint(x: 91.5, y: 549.0),
            CGPoint(x: 139.5, y: 549.0),
            CGPoint(x: 187.5, y: 549.0),
            CGPoint(x: 235.5, y: 549.0),
            CGPoint(x: 283.5, y: 549.0),
            ],
        [
            CGPoint(x: 91.5, y: 501.0),
            CGPoint(x: 139.5, y: 501.0),
            CGPoint(x: 187.5, y: 501.0),
            CGPoint(x: 235.5, y: 501.0),
            CGPoint(x: 283.5, y: 501.0),
            ],
        [
            CGPoint(x: 91.5, y: 453.0),
            CGPoint(x: 139.5, y: 453.0),
            CGPoint(x: 187.5, y: 453.0),
            CGPoint(x: 235.5, y: 453.0),
            CGPoint(x: 283.5, y: 453.0),
            ],
        [
            CGPoint(x: 91.5, y: 405.0),
            CGPoint(x: 139.5, y: 405.0),
            CGPoint(x: 187.5, y: 405.0),
            CGPoint(x: 235.5, y: 405.0),
            CGPoint(x: 283.5, y: 405.0),
            ],
        [
            CGPoint(x: 91.5, y: 357.0),
            CGPoint(x: 139.5, y: 357.0),
            CGPoint(x: 187.5, y: 357.0),
            CGPoint(x: 235.5, y: 357.0),
            CGPoint(x: 283.5, y: 357.0),
            ],
        [
            CGPoint(x: 91.5, y: 309.0),
            CGPoint(x: 139.5, y: 309.0),
            CGPoint(x: 187.5, y: 309.0),
            CGPoint(x: 235.5, y: 309.0),
            CGPoint(x: 283.5, y: 309.0),
            ],
        [
            CGPoint(x: 91.5, y: 261.0),
            CGPoint(x: 139.5, y: 261.0),
            CGPoint(x: 187.5, y: 261.0),
            CGPoint(x: 235.5, y: 261.0),
            CGPoint(x: 283.5, y: 261.0),
            ],
        [
            CGPoint(x: 91.5, y: 213.0),
            CGPoint(x: 139.5, y: 213.0),
            CGPoint(x: 187.5, y: 213.0),
            CGPoint(x: 235.5, y: 213.0),
            CGPoint(x: 283.5, y: 213.0),
            ],
        [
            CGPoint(x: 91.5, y: 165.0),
            CGPoint(x: 139.5, y: 165.0),
            CGPoint(x: 187.5, y: 165.0),
            CGPoint(x: 235.5, y: 165.0),
            CGPoint(x: 283.5, y: 165.0),
            ],
        [
            CGPoint(x: 91.5, y: 117.0),
            CGPoint(x: 139.5, y: 117.0),
            CGPoint(x: 187.5, y: 117.0),
            CGPoint(x: 235.5, y: 117.0),
            CGPoint(x: 283.5, y: 117.0),
            ]
    ]
    
    static let originLocation: [[CGPoint]] = [
        [
            CGPoint(x: 75.0, y: 532.5),
            CGPoint(x: 123.0, y: 532.5),
            CGPoint(x: 171.0, y: 532.5),
            CGPoint(x: 219.0, y: 532.5),
            CGPoint(x: 267.0, y: 532.5),
            ],
        [
            CGPoint(x: 75.0, y: 484.5),
            CGPoint(x: 123.0, y: 484.5),
            CGPoint(x: 171.0, y: 484.5),
            CGPoint(x: 219.0, y: 484.5),
            CGPoint(x: 267.0, y: 484.5),
            ],
        [
            CGPoint(x: 75.0, y: 436.5),
            CGPoint(x: 123.0, y: 436.5),
            CGPoint(x: 171.0, y: 436.5),
            CGPoint(x: 219.0, y: 436.5),
            CGPoint(x: 267.0, y: 436.5),
            ],
        [
            CGPoint(x: 75.0, y: 388.5),
            CGPoint(x: 123.0, y: 388.5),
            CGPoint(x: 171.0, y: 388.5),
            CGPoint(x: 219.0, y: 388.5),
            CGPoint(x: 267.0, y: 388.5),
            ],
        [
            CGPoint(x: 75.0, y: 340.5),
            CGPoint(x: 123.0, y: 340.5),
            CGPoint(x: 171.0, y: 340.5),
            CGPoint(x: 219.0, y: 340.5),
            CGPoint(x: 267.0, y: 340.5),
            ],
        [
            CGPoint(x: 75.0, y: 292.5),
            CGPoint(x: 123.0, y: 292.5),
            CGPoint(x: 171.0, y: 292.5),
            CGPoint(x: 219.0, y: 292.5),
            CGPoint(x: 267.0, y: 292.5),
            ],
        [
            CGPoint(x: 75.0, y: 244.5),
            CGPoint(x: 123.0, y: 244.5),
            CGPoint(x: 171.0, y: 244.5),
            CGPoint(x: 219.0, y: 244.5),
            CGPoint(x: 267.0, y: 244.5),
            ],
        [
            CGPoint(x: 75.0, y: 196.5),
            CGPoint(x: 123.0, y: 196.5),
            CGPoint(x: 171.0, y: 196.5),
            CGPoint(x: 219.0, y: 196.5),
            CGPoint(x: 267.0, y: 196.5),
            ],
        [
            CGPoint(x: 75.0, y: 148.5),
            CGPoint(x: 123.0, y: 148.5),
            CGPoint(x: 171.0, y: 148.5),
            CGPoint(x: 219.0, y: 148.5),
            CGPoint(x: 267.0, y: 148.5),
            ],
        [
            CGPoint(x: 75.0, y: 100.5),
            CGPoint(x: 123.0, y: 100.5),
            CGPoint(x: 171.0, y: 100.5),
            CGPoint(x: 219.0, y: 100.5),
            CGPoint(x: 267.0, y: 100.5),
            ],
        ]
    
}
