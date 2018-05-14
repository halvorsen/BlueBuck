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
    
    internal let color : [BlockType: UIColor] = [
        .white: Color.white,
        .blue: Color.blue,
        .green: Color.green,
        .pink: Color.pink,
        .yellow: Color.yellow
        
    ]
    
    internal var game : Game?
    
//    override init() {
//        super.init()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    internal var squares : [SKShapeNode] = []
    
    internal var locations : [[CGPoint]] = [[]]
    
    override func didMove(to view: SKView) {
        backgroundColor = Color.black
        for i in 0..<10 {
            var newRow : [CGPoint] = []
            for j in 0..<5 {
                let newLocation = CGPoint(x: 91.5 + 48*CGFloat(j), y: 549 - 48*CGFloat(i))
                newRow.append(newLocation)
                let newShape = SKShapeNode(rectOf: CGSize(width: 33, height: 33), cornerRadius: 0)
                newShape.lineWidth = 5
                if let game = game,
                    game.originalAllBlocks.count > (5*i + j),
                    let color = color[game.originalAllBlocks[5*i + j].blockType] {
                    newShape.strokeColor = color
                }
                newShape.lineJoin = .miter
                addChild(newShape)
                newShape.position = newLocation
            }
            locations.append(newRow)
        }
        
    }
    
    
   
}
