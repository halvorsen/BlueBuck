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
    
    CGPoint(x: 23*Global.screenWidthScalar, y: -4*Global.screenWidthScalar),
    CGPoint(x: 17*Global.screenWidthScalar, y: 10*Global.screenWidthScalar),
    CGPoint(x: 22*Global.screenWidthScalar, y: -21*Global.screenWidthScalar),
    CGPoint(x: -20*Global.screenWidthScalar, y: 24*Global.screenWidthScalar),
    CGPoint(x: 0, y: -18*Global.screenWidthScalar),
    CGPoint(x: -30*Global.screenWidthScalar, y: 13*Global.screenWidthScalar),
    CGPoint(x: 18*Global.screenWidthScalar, y: -13*Global.screenWidthScalar),
    CGPoint(x: 11*Global.screenWidthScalar, y: 15*Global.screenWidthScalar),
    CGPoint(x: -16*Global.screenWidthScalar, y: 13*Global.screenWidthScalar),
    CGPoint(x: -19*Global.screenWidthScalar, y: 0*Global.screenWidthScalar),
    CGPoint(x: 23*Global.screenWidthScalar, y: 22*Global.screenWidthScalar),
    CGPoint(x: 2*Global.screenWidthScalar, y: 19*Global.screenWidthScalar),
    CGPoint(x: -16*Global.screenWidthScalar, y: -10*Global.screenWidthScalar),
    CGPoint(x: -7*Global.screenWidthScalar, y: 15*Global.screenWidthScalar),
    CGPoint(x: -9*Global.screenWidthScalar, y: 13*Global.screenWidthScalar),
    CGPoint(x: 14*Global.screenWidthScalar, y: -1*Global.screenWidthScalar),
    CGPoint(x: -11*Global.screenWidthScalar, y: 22*Global.screenWidthScalar),
    CGPoint(x: -17*Global.screenWidthScalar, y: -19*Global.screenWidthScalar)
    
    ]
}
