//
//  GameScene.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import SpriteKit
import GameplayKit

internal protocol GameSceneDelegate: class {
    func showButtons()
}

class GameScene: SKScene {
    
    internal weak var gameDelegate: GameSceneDelegate?
    
    let tap = UITapGestureRecognizer()
    
    internal var game : Game?
    
    internal var squares : [[Block]] = [[]]
    
    override func didMove(to view: SKView) {
        backgroundColor = Color.black
        guard let game = game else { return }
        squares = game.currentBoard
        let (first, second, third, fourth, fifth) = game.currentUpcomingQueueIndexes()
        for row in squares {
            for square in row  {
                addChild(square.shapeNode)
            }
        }
        for square in [game.blockQueue[first], game.blockQueue[second], game.blockQueue[third], game.blockQueue[fourth], game.blockQueue[fifth]] {
            addChild(square.shapeNode)
        }
        tap.addTarget(self, action: #selector(tapFunc(_:)))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func tapFunc(_ gesture: UITapGestureRecognizer) {
        
        var tapLocation = gesture.location(in: view)
        tapLocation.y = UIScreen.main.bounds.height - tapLocation.y
        for row in squares {
            for square in row {
                let modifiedFrame = CGRect(x: square.shapeNode.frame.origin.x - 5, y: square.shapeNode.frame.origin.y - 5, width: square.shapeNode.frame.width + 10, height: square.shapeNode.frame.width + 10)
                if modifiedFrame.contains(tapLocation) {
                    tappedOn(square)
                    return
                }
            }
        }
        didNotTapOnBlock()
    }
    
    private func tappedOn(_ block: Block) {
        guard let game = game else { return }
        let queueIndex = game.currentQueueIndex()
        game.incrementQueue(by: 1)
        let replacementBlock = game.blockQueue[queueIndex]

        if let color = color[replacementBlock.blockType] {
            replacementBlock.shapeNode.strokeColor = color
        }

        replacementBlock.shapeNode.lineJoin = .miter
        replacementBlock.shapeNode.path = Path.big
        replacementBlock.location = block.location
        replacementBlock.shapeNode.lineWidth = 5
        let move = SKAction.move(to: block.shapeNode.position, duration: 1.0)
        replacementBlock.shapeNode.run(move)
        
        block.shapeNode.removeFromParent()
    }
    
    private func didNotTapOnBlock() {
        gameDelegate?.showButtons()
    }
    
}
