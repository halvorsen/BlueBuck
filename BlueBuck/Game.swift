//
//  Game.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/13/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

internal protocol GameDelegate: class {
    func updateView()
}

internal final class Game {
    
    internal var delegate: GameDelegate?
    private(set) internal var originalAllBlocks: [Block]
    private(set) internal var blockQueue: [Block]
    private(set) internal var currentBoard: [[Block]] = [[]]
    private(set) internal var gameOrientation: DeviceDirection = .up
    private(set) internal var buttonsVisible: Bool = false
    
    init(blocks: [Block]) {
        self.originalAllBlocks = blocks
        self.blockQueue = blocks
        
    }
    
    internal func tap(block: Block) {
        
    }
    
    internal func movedDevice() {
        
    }
    
    internal func toggledButtons() {
        
    }
    
    
    
}
