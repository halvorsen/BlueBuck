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

class GameViewController: UIViewController, GameSceneDelegate {
    
    private var scene = GameScene()
    private var gameView = GameView()
    internal var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.black
        gameView.frame = view.bounds
        view.addSubview(gameView)
        scene.size = view.bounds.size
        scene.scaleMode = .aspectFill
        scene.backgroundColor = .black
        scene.game = game
        scene.gameDelegate = self
        gameView.presentScene(scene)
    }
    
    internal func showButtons() {
        print("showButtons")
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
