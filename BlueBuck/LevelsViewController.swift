//
//  LevelsViewController.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/13/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController {
    
    private var game: Game?
    private lazy var levelsView = LevelsView(frame: view.bounds)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(levelsView)
        for button in levelsView.buttons {
            button.addTarget(self, action: #selector(levelTouchUpInside(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func levelTouchUpInside(_ sender: UIButton) {
        if let level = Levels.levelByTag[sender.tag] {
        loadAndPresentGame(level)
        } else {
            print("level was nil")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        loadAnPresentGame(.level3)
    }
    
    private func loadAndPresentGame(_ level: BuckLevel) {
        var blocks: [Block] = []
        for i in 0..<10 {
            for j in 0..<5 {
                let index = 5*i + j
                if let color = Levels.blockTypeArray[level],
                    color.count > index {
                    let newBlock = Block.init(location: (row: i + 1, column: j + 1), type: color[index])
                    blocks.append(newBlock)
                }
            }
        }
        for i in 50..<100 {
            if let color = Levels.blockTypeArray[level],
                color.count > i {
                let newBlock = Block.init(location: (row: 0, column: 0), type: color[i])
                blocks.append(newBlock)
            }
        }
        game = Game(blocks: blocks, level: level)
        
        let viewController = GameViewController()
        viewController.game = game
        present(viewController, animated: true)
        
    }
    
    private func createLevelsUtility() { // create and print a random level
        let colorDictionary: [UInt32: BlockType] = [
            0: .white,
            1: .blue,
            2: .green,
            3: .pink,
            4: .yellow
        ]
        for i in 1...21 {
            print("\(i): [")
            for _ in 0..<20 {
                let randomNumber = arc4random_uniform(5)
                let randomNumber1 = arc4random_uniform(5)
                let randomNumber2 = arc4random_uniform(5)
                let randomNumber3 = arc4random_uniform(5)
                let randomNumber4 = arc4random_uniform(5)
                print("\(colorDictionary[randomNumber]!), \(colorDictionary[randomNumber1]!), \(colorDictionary[randomNumber2]!), \(colorDictionary[randomNumber3]!), \(colorDictionary[randomNumber4]!),")
            }
            print("],")
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
