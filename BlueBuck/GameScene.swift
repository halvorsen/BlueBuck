//
//  GameScene.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    internal var squares : [SKShapeNode] = []
    
    internal var locations : [[CGPoint]] = [[]]
    
    override func didMove(to view: SKView) {
        
        for i in 0..<10 {
            var newRow : [CGPoint] = []
            for j in 0..<5 {
                let newLocation = CGPoint(x: 91.5 + 48*CGFloat(j), y: 549 - 48*CGFloat(i))
                newRow.append(newLocation)
                let newShape = SKShapeNode(rectOf: CGSize(width: 38, height: 38), cornerRadius: 0)
                newShape.lineWidth = 5
                newShape.strokeColor = UIColor.white
                newShape.lineJoin = .miter
                addChild(newShape)
                newShape.position = newLocation
            }
            locations.append(newRow)
        }
        
    }
    
    
   
}
