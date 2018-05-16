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
    private let levels = Levels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let viewController = GameViewController()
        loadGame(1)
        viewController.game = game
        present(viewController, animated: true)
    }
    
    private func loadGame(_ level: Int) {
        var blocks: [Block] = []
        for i in 0..<10 {
            for j in 0..<5 {
                let index = 5*i + j
                if let color = levels.blockTypeArray[level],
                    color.count > index {
                    let newBlock = Block.init(location: (row: i + 1, column: j + 1), type: color[index])
                    blocks.append(newBlock)
                }
            }
        }
        for i in 50..<100 {
            if let color = levels.blockTypeArray[level],
                color.count > i {
                let newBlock = Block.init(location: (row: 0, column: 0), type: color[i])
                blocks.append(newBlock)
            }
        }
        game = Game(blocks: blocks)
        
    }
    
    private func createLevelsUtility() {
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
    
}
