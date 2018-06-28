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
    
    CGPoint(x: 23*Global.screenCommonScalar, y: -4*Global.screenCommonScalar),
    CGPoint(x: 17*Global.screenCommonScalar, y: 10*Global.screenCommonScalar),
    CGPoint(x: 22*Global.screenCommonScalar, y: -21*Global.screenCommonScalar),
    CGPoint(x: -20*Global.screenCommonScalar, y: 24*Global.screenCommonScalar),
    CGPoint(x: 0, y: -18*Global.screenCommonScalar),
    CGPoint(x: -30*Global.screenCommonScalar, y: 13*Global.screenCommonScalar),
    CGPoint(x: 18*Global.screenCommonScalar, y: -13*Global.screenCommonScalar),
    CGPoint(x: 11*Global.screenCommonScalar, y: 15*Global.screenCommonScalar),
    CGPoint(x: -16*Global.screenCommonScalar, y: 13*Global.screenCommonScalar),
    CGPoint(x: -19*Global.screenCommonScalar, y: 0*Global.screenCommonScalar),
    CGPoint(x: 23*Global.screenCommonScalar, y: 22*Global.screenCommonScalar),
    CGPoint(x: 2*Global.screenCommonScalar, y: 19*Global.screenCommonScalar),
    CGPoint(x: -16*Global.screenCommonScalar, y: -10*Global.screenCommonScalar),
    CGPoint(x: -7*Global.screenCommonScalar, y: 15*Global.screenCommonScalar),
    CGPoint(x: -9*Global.screenCommonScalar, y: 13*Global.screenCommonScalar),
    CGPoint(x: 14*Global.screenCommonScalar, y: -1*Global.screenCommonScalar),
    CGPoint(x: -11*Global.screenCommonScalar, y: 22*Global.screenCommonScalar),
    CGPoint(x: -17*Global.screenCommonScalar, y: -19*Global.screenCommonScalar)
    
    ]
}
