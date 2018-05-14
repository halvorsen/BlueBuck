//
//  GameViewController.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var scene = GameScene()
    var gameView = GameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameView.frame = view.bounds
        view.addSubview(gameView)
        scene.size = view.bounds.size
        scene.scaleMode = .aspectFill
        scene.backgroundColor = .black
        gameView.presentScene(scene)
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
