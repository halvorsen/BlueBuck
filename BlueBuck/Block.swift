//
//  Block.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/13/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import SpriteKit

internal enum BlockType {
    case blue, pink, yellow, white, green
}

internal enum DeviceDirection {
    case up, upsideDown, left, right
}

internal final class Block {
    
    internal var location: (row: Int, column: Int)
    private(set) internal var neighbor: (north: Block?, south: Block?, east: Block?, west: Block?) = (nil, nil, nil, nil)
    internal let blockType: BlockType
    internal var shapeNode: SKShapeNode
    
    init(location: (row: Int, column: Int), type: BlockType) {
        self.location = location
        self.blockType = type
        shapeNode = SKShapeNode(rectOf: CGSize(width: 33, height: 33), cornerRadius: 0)
    }
    
    internal func tapped() {
        
    }
    
    
}
