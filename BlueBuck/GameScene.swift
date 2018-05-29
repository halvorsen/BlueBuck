//
//  GameScene.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//
import Foundation
import SpriteKit
import GameplayKit
import CoreMotion

internal protocol GameSceneDelegate: class {
    func tapOnGame()
    func updatePatternViews()
}

class GameScene: SKScene {
    
    internal weak var gameDelegate: GameSceneDelegate?
    private var unlocked = true
    private var dropTime: Double = 0.2
    internal var objectiveModel: ObjectiveModel?
    let motionManager = CMMotionManager()
    let tap = UITapGestureRecognizer()
    var orientation: DeviceDirection = .up
    internal var game : Game?
    internal var search: Search?
    internal var squares: [Block] = []
    
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
        for row in game.currentBoard {
            for block in row {
                squares.append(block)
            }
        }
        let (first, second, third, fourth, fifth) = game.currentUpcomingQueueIndexes()
        for square in squares {
            addChild(square.shapeNode)
        }
        for square in [game.blockQueue[first], game.blockQueue[second], game.blockQueue[third], game.blockQueue[fourth], game.blockQueue[fifth]] {
            addChild(square.shapeNode)
        }
        tap.addTarget(self, action: #selector(tapFunc(_:)))
        view.addGestureRecognizer(tap)
        
    }
    
    private func search(for patterns: [Pattern]) -> (gameOver: Bool, successBlocks: [Block]) {
        search = Search(squares)
        let results = search?.patterns(patterns)
        print(results!)
        return processResults(results: results!)
    }
    
    private func updatePatternViews() {
        gameDelegate?.updatePatternViews()
    }
    
    private func animateDisappearBlocks(_ blocks: [Block], completion: @escaping () -> Void) {
        if blocks.count > 0 {
            let twinkleNode = BlockTwinkle()
         
            twinkleNode.position = blocks[0].shapeNode.position
            addChild(twinkleNode)
            twinkleNode.animate() {
                twinkleNode.removeFromParent()
                completion()
            }
        } else {
            completion()
        }
    }
    
    private func processResults(results: [(pattern: Pattern, blocks: [Block])]) -> (gameOver: Bool, successBlocks: [Block]) {
        guard let objectiveModel = objectiveModel else { return (false,[])}
        var patternsFound: [Pattern] = []
        var successBlockShapes: [SKShapeNode] = []
        var successBlock: [Block] = []
        for result in results {
            
            var maybeSuccessBlockShapes: [SKShapeNode] = []
            var maybeSuccessBlock: [Block] = []
            var havntDoubledBlock = true
            
            for block in result.blocks {
                maybeSuccessBlockShapes.append(block.shapeNode)
                maybeSuccessBlock.append(block)
            }
            
            for blockShape in maybeSuccessBlockShapes {
                if successBlockShapes.contains(blockShape) {
                    havntDoubledBlock = false
                }
            }
            
            if havntDoubledBlock {
                patternsFound.append(result.pattern)
                successBlockShapes = successBlockShapes + maybeSuccessBlockShapes
                successBlock = successBlock + maybeSuccessBlock
                self.objectiveModel?.foundPattern(pattern: result.pattern)
            }
            
        }
        
        for patternGoal in objectiveModel.patternArray {
            if patternGoal.objective > patternGoal.completed {
                return (false, successBlock)
            }
        }
        return (true, successBlock)
    }
    
    private func gameComplete() {
        //game end sequence
    }
    
    @objc private func tapFunc(_ gesture: UITapGestureRecognizer) {
        gameDelegate?.tapOnGame()
        var tapLocation = gesture.location(in: view)
        tapLocation.y = UIScreen.main.bounds.height - tapLocation.y
        for i in 0..<squares.count {
            
            let modifiedFrame = CGRect(x: squares[i].shapeNode.frame.origin.x - 5, y: squares[i].shapeNode.frame.origin.y - 5, width: squares[i].shapeNode.frame.width + 10, height: squares[i].shapeNode.frame.width + 10)
            if modifiedFrame.contains(tapLocation) {
                tappedOn(squares[i], index: i)
                return
            }
            
        }
    }
    
    private func addBlockToQueue(_ newBlock: Block) {
        
        newBlock.shapeNode = SKShapeNode(rectOf: CGSize(width: 14, height: 14), cornerRadius: 0)
        newBlock.shapeNode.lineWidth = 3
        
        if let color = color[newBlock.blockType] {
            newBlock.shapeNode.strokeColor = color
        }
        newBlock.shapeNode.lineJoin = .miter
        newBlock.shapeNode.position = CGPoint(x: 56.5, y: 560.5)
        addChild(newBlock.shapeNode)
        
    }
    
    private func moveQueueBlocksIntoOpenings() {
        let drop = SKAction.moveBy(x: 0, y: -21, duration: dropTime)
        if let queueIndex = game?.currentQueueIndex() {
            for i in queueIndex..<(queueIndex + 4) {
                if let block = game?.blockQueue[i] {
                    block.shapeNode.run(drop)
                }
            }
        }
    }
    
    private func tappedOn(_ block: Block, index: Int) {
    
        guard let game = game else { return }
        guard unlocked else { return }
        unlocked = false
        let queueIndex = game.currentQueueIndex()
        game.incrementQueue(by: 1)
        let replacementBlock = game.blockQueue[queueIndex]
        let newQueueBlock = game.blockQueue[queueIndex + 5]
        
        replacementBlock.shapeNode.lineJoin = .miter
        replacementBlock.shapeNode.path = Path.big
        replacementBlock.shapeNode.lineWidth = 5
        
        var newPosition = CGPoint()
        switch orientation {
        case .up:
            replacementBlock.location = (row: 1, column: block.location.column)
            newPosition = Game.originLocation[0][block.location.column - 1]
        case .upsideDown:
            replacementBlock.location = (row: 10, column: block.location.column)
            newPosition = Game.originLocation[9][block.location.column - 1]
        case .left:
            replacementBlock.location = (row: block.location.row, column: 5)
            newPosition = Game.originLocation[block.location.row - 1][4]
        case .right:
            replacementBlock.location = (row: block.location.row, column: 1)
            newPosition = Game.originLocation[block.location.row - 1][0]
        }
        
        let moveReplacementBlock = SKAction.move(to: newPosition, duration: 0.5)
        
        replacementBlock.shapeNode.run(moveReplacementBlock)
        
        block.shapeNode.removeFromParent()
        moveBlocksIntoOpenings(block)
        moveQueueBlocksIntoOpenings()
        squares.remove(at: index)
        squares.append(replacementBlock)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dropTime*2) {
            self.addBlockToQueue(newQueueBlock)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dropTime*3) { [weak self] in
            guard let weakself = self else { return }
            
            if let patternArray = weakself.objectiveModel?.patternArray {
                var patterns: [Pattern] = []
                for goal in patternArray {
                    if goal.completed < goal.objective {
                        patterns.append(goal.pattern)
                    }
                }
                let (completedGame, successBlocks) = weakself.search(for: patterns)
                weakself.updatePatternViews()
                weakself.animateDisappearBlocks(successBlocks) {
                    if completedGame {
                        weakself.gameComplete()
                    } else {
                        weakself.unlocked = true
                    }
                }
            }
        }
    }
    
    private func moveBlocksIntoOpenings(_ removedBlock: Block) {
        
        var indexes: [(row: Int, column: Int)] = []
     
        indexes.append(removedBlock.location)
      
        switch orientation {
        case .up:
            dropWithOrientationUp(indexes)
        case .upsideDown:
            dropWithOrientationUpSideDown(indexes)
        case .left:
            dropWithOrientationLeft(indexes)
        case .right:
            dropWithOrientationRight(indexes)
        }
        
    }
    
    private func dropWithOrientationUp(_ indexes: [(row: Int, column: Int)]) {
 
        let drop = SKAction.moveBy(x: 0, y: -48, duration: dropTime)
 
            for block in squares {
                for index in indexes {
                    if block.location.column == index.column && block.location.row < index.row {
                        block.location.row += 1
                        block.shapeNode.run(drop)
                    }
                    
                }
            }
        
    }
    private func dropWithOrientationUpSideDown(_ indexes: [(row: Int, column: Int)]) {
   
        let drop = SKAction.moveBy(x: 0, y: 48, duration: dropTime)
    
            for block in squares {
                for index in indexes {
                    if block.location.column == index.column && block.location.row > index.row {
                        block.location.row -= 1
                        block.shapeNode.run(drop)
                    }
                    
                }
            }
        
    }
    private func dropWithOrientationLeft(_ indexes: [(row: Int, column: Int)]) {
     
        let drop = SKAction.moveBy(x: -48, y: 0, duration: dropTime)
      
            for block in squares {
                for index in indexes {
                    if block.location.row == index.row && block.location.column > index.column {
                        block.location.column -= 1
                        block.shapeNode.run(drop)
                    }
                    
                }
            }
        
    }
    private func dropWithOrientationRight(_ indexes: [(row: Int, column: Int)]) {
 
        let drop = SKAction.moveBy(x: 48, y: 0, duration: dropTime)
       
            for block in squares {
                for index in indexes {
                    if block.location.row == index.row && block.location.column < index.column {
                        block.location.column += 1
                        block.shapeNode.run(drop)
                    }
                    
                }
            }
        
    }
}
