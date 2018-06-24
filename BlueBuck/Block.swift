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
    internal var blockType: BlockType
    internal var shapeNode: SKShapeNode
    internal var indexOfBlockInSquareArray = 0
    
    init(location: (row: Int, column: Int), type: BlockType) {
        self.location = location
        self.blockType = type
        shapeNode = SKShapeNode(rectOf: CGSize(width: 33*Global.screenWidthScalar, height: 33*Global.screenWidthScalar), cornerRadius: 0)
    }
    
    internal func set(with config: BlockConfig) {
        location = config.location
        blockType = config.blockType
    }
    
}
