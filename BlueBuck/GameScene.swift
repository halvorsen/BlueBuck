//
//  GameScene.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

internal protocol GameSceneDelegate: class {
    func showButtons()
}

class GameScene: SKScene {
    
    internal weak var gameDelegate: GameSceneDelegate?
    
    let motionManager = CMMotionManager()
    let tap = UITapGestureRecognizer()
    var orientation: DeviceDirection = .up
    internal var game : Game?
    
    internal var squares : [[Block]] = [[]]
    
    override func didMove(to view: SKView) {
        
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.2;
            motionManager.startDeviceMotionUpdates()
            
            motionManager.gyroUpdateInterval = 0.5
            guard let currentQueue = OperationQueue.current else { return }
            motionManager.startDeviceMotionUpdates(to: currentQueue) { [weak self] (motion, error) in
                if let attitude = motion?.attitude {
                    
                    if -0.785...0.785 ~= attitude.yaw {
                        self?.orientation = .up
                    }
                    else if 0.785...2.355 ~= attitude.yaw {
                        self?.orientation = .left
                    }
                    else if -2.355...(-0.785) ~= attitude.yaw {
                        self?.orientation = .right
                    }
                    else {
                        self?.orientation = .upsideDown
                    }
             
                }
            }
        }
        
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
//        let queueIndex = game.currentQueueIndex()
//        game.incrementQueue(by: 1)
//        let replacementBlock = game.blockQueue[queueIndex]
//
//        if let color = color[replacementBlock.blockType] {
//            replacementBlock.shapeNode.strokeColor = color
//        }
//
//        replacementBlock.shapeNode.lineJoin = .miter
//        replacementBlock.shapeNode.path = Path.big
//        replacementBlock.location = block.location
//        replacementBlock.shapeNode.lineWidth = 5
//        let move = SKAction.move(to: block.shapeNode.position, duration: 1.0)
//        replacementBlock.shapeNode.run(move)
      
        block.shapeNode.removeFromParent()
        moveBlocksIntoOpenings([block])
    }
    
    private func didNotTapOnBlock() {
        gameDelegate?.showButtons()
    }
    
    private func moveBlocksIntoOpenings(_ removedBlocks: [Block]) {
        
        var indexes: [(row: Int, column: Int)] = []
        for block in removedBlocks {
            indexes.append(block.location)
            block.location = (0,0)
        }
        
        switch orientation {
        case .up: dropWithOrientationUp(indexes)
        case .upsideDown: dropWithOrientationUpSideDown(indexes)
        case .left: dropWithOrientationLeft(indexes)
        case .right: dropWithOrientationRight(indexes)
        }
        
    }
    
    private func dropWithOrientationUp(_ indexes: [(row: Int, column: Int)]) {
        guard let game = game else { return }
        let drop = SKAction.moveBy(x: 0, y: -48, duration: 0.5)
        for row in game.currentBoard {
            for block in row {
                for index in indexes {
                    if block.location.column == index.column && block.location.row < index.row {
                        block.location.row += 1
                        block.shapeNode.run(drop)
                    }
                    
                }
            }
        }
    }
    private func dropWithOrientationUpSideDown(_ indexes: [(row: Int, column: Int)]) {
        guard let game = game else { return }
        let drop = SKAction.moveBy(x: 0, y: 48, duration: 0.5)
        for row in game.currentBoard {
            for block in row {
                for index in indexes {
                    if block.location.column == index.column && block.location.row > index.row {
                        block.location.row -= 1
                        block.shapeNode.run(drop)
                    }
                    
                }
            }
        }
    }
    private func dropWithOrientationLeft(_ indexes: [(row: Int, column: Int)]) {
        guard let game = game else { return }
        let drop = SKAction.moveBy(x: -48, y: 0, duration: 0.5)
        for row in game.currentBoard {
            for block in row {
                for index in indexes {
                    if block.location.row == index.row && block.location.column > index.column {
                        block.location.column -= 1
                        block.shapeNode.run(drop)
                    }
                    
                }
            }
        }
    }
    private func dropWithOrientationRight(_ indexes: [(row: Int, column: Int)]) {
        guard let game = game else { return }
        let drop = SKAction.moveBy(x: 48, y: 0, duration: 0.5)
        for row in game.currentBoard {
            for block in row {
                for index in indexes {
                    if block.location.row == index.row && block.location.column < index.column {
                        block.location.column += 1
                        block.shapeNode.run(drop)
                    }
                    
                }
            }
        }
    }
    
    
}
