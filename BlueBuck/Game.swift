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
      
        for k in 50..<55 {
            let newLocation = CGPoint(x: 56.5, y: 476.5 + (CGFloat(k) - 50)*21)
            blocks[k].shapeNode = SKShapeNode(rectOf: CGSize(width: 14, height: 14), cornerRadius: 0)
            blocks[k].shapeNode.lineWidth = 3
            if originalAllBlocks.count > k,
                let color = color[blocks[k].blockType] {
                blocks[k].shapeNode.strokeColor = color
            }
            blocks[k].shapeNode.lineJoin = .miter
            blocks[k].shapeNode.position = newLocation
        }
        
    }
    
    internal func currentQueueIndex() -> Int {
        let index = queueIndex%100
        return index
    }
    
    internal func currentUpcomingQueueIndexes() -> (first: Int, second: Int, third: Int, fourth: Int, fifth: Int) {
        return (queueIndex%100, (queueIndex + 1)%100, (queueIndex + 2)%100, (queueIndex + 3)%100, (queueIndex + 4)%100)
    }
    
    internal func incrementQueue(by amount: Int) {
        queueIndex += amount
    }
    
    internal func tap(block: Block) {
        
    }
    
    internal func movedDevice() {
        
    }
    
    internal func toggledButtons() {
        
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
