//
//  BlockTwinkleView.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/28/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import SpriteKit

internal final class BlockTwinkle: SKNode {
    
    var twinkles = [SKSpriteNode]()
    let texture = SKTexture(image: #imageLiteral(resourceName: "star"))
    
    override init() {
        super.init()
        twinkles = [SKSpriteNode(texture: texture),SKSpriteNode(texture: texture),SKSpriteNode(texture: texture),SKSpriteNode(texture: texture)]
        let randomIndex = Int(arc4random_uniform(18))
        
        for i in 0..<twinkles.count {
            let index = (randomIndex + i)%18
            twinkles[i].position = location[index]
            twinkles[i].alpha = 0.0
            addChild(twinkles[i])
        }
    }
    
    internal func animate(time: TimeInterval, completion: @escaping () -> Void) {
    
        let fadeOut = SKAction.fadeOut(withDuration: time*0.2)
        let fadeIn = SKAction.fadeIn(withDuration: time*0.2)
        for i in 0..<twinkles.count {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + (Double(i)/6)) { [weak self] in
                self?.twinkles[i].run(fadeIn)
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5 + (Double(i)/6)) { [weak self] in
                self?.twinkles[i].run(fadeOut)
            }
            
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            completion()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let location: [CGPoint] = [
    
    CGPoint(x: 23, y: -4),
    CGPoint(x: 17, y: 10),
    CGPoint(x: 22, y: -21),
    CGPoint(x: -20, y: 24),
    CGPoint(x: 0, y: -18),
    CGPoint(x: -30, y: 13),
    CGPoint(x: 18, y: -13),
    CGPoint(x: 11, y: 15),
    CGPoint(x: -16, y: 13),
    CGPoint(x: -19, y: 0),
    CGPoint(x: 23, y: 22),
    CGPoint(x: 2, y: 19),
    CGPoint(x: -16, y: -10),
    CGPoint(x: -7, y: 15),
    CGPoint(x: -9, y: 13),
    CGPoint(x: 14, y: -1),
    CGPoint(x: -11, y: 22),
    CGPoint(x: -17, y: -19)
    
    ]
}
