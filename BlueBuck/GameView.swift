//
//  GameView.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreGraphics

internal final class GameView: SKView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Color.black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
