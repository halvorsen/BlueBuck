//
//  LevelsView.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/28/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

internal final class LevelsView: UIScrollView {
    private lazy var levelBackgroundView = UIImageView(image: #imageLiteral(resourceName: "LevelsBackground"))
    internal var buttons: [UIButton] = []
    internal var scoreLabels: [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bounces = false
        backgroundColor = Color.black
        for _ in 0..<buttonLocations.count {
            buttons.append(UIButton())
            scoreLabels.append(UILabel())
        }
        showsVerticalScrollIndicator = false
        contentSize = CGSize(width: 375*Global.screenWidthScalar, height: 3000*Global.screenCommonScalar)
        
       
        levelBackgroundView.frame.size = contentSize
        levelBackgroundView.center.x = self.center.x
        if UIScreen.main.bounds.height > 810 {
            contentSize = CGSize(width: 375*Global.screenCommonScalar, height: 2970)
        }
        addSubview(levelBackgroundView)
        for i in 0..<buttons.count {
            
            buttons[i].setTitle("\(i + 1)", for: .normal)
            buttons[i].titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18*Global.screenCommonScalar)
            buttons[i].setTitleColor(Color.blue, for: .normal)
            buttons[i].frame.size = CGSize(width: 53*Global.screenCommonScalar, height: 53*Global.screenCommonScalar)
            buttons[i].layer.cornerRadius = buttons[i].frame.size.width * 0.5
            buttons[i].layer.borderColor = Color.blue.cgColor
            buttons[i].layer.borderWidth = 4*Global.screenCommonScalar
            buttons[i].clipsToBounds = true
            buttons[i].tag = i
            buttons[i].backgroundColor = Color.white
            buttons[i].center = buttonLocations[i]
            if i > 14 && !MyUser.shared.playerHasPaid && !MyUser.shared.playerHas10ScoreFor6Of15 {
                buttons[i].setTitle("🔒", for: .normal)
            }
         
        }
        
        setScoreLabels()
      
        contentOffset.y = contentSize.height - 667*Global.screenCommonScalar
        if UIScreen.main.bounds.height > 810 {
            contentOffset.y = contentSize.height - 730*Global.screenCommonScalar
        }
        for button in buttons {
            addSubview(button)
        }
    }
    
    internal func setScoreLabelText() {
        for i in 0..<scoreLabels.count {
            if let score = MyUser.shared.playerScores[String(i)] {
                scoreLabels[i].text = score
                scoreLabels[i].sizeToFit()
            }
        }
    }
    
    private func setScoreLabels() {
        setScoreLabelText()
        for i in 0..<scoreLabels.count {
            
            scoreLabels[i].textColor = .white
            scoreLabels[i].alpha = 0.7
            scoreLabels[i].font = UIFont(name: "GothamBold", size: 18*Global.screenCommonScalar)
            
            scoreLabels[i].frame.origin = buttons[i].center
            scoreLabels[i].frame.origin.x += 45*Global.screenCommonScalar
            scoreLabels[i].frame.origin.y += 15*Global.screenCommonScalar
            scoreLabels[i].addTextSpacing(value: 1.77*Global.screenCommonScalar)
            scoreLabels[i].sizeToFit()
            addSubview(scoreLabels[i])
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let buttonLocations: [CGPoint] = [
        CGPoint(x: 81*Global.screenWidthScalar, y: 2910*Global.screenHeightScalar),
        CGPoint(x: 81*Global.screenWidthScalar, y: 2785*Global.screenHeightScalar),
        CGPoint(x: 94*Global.screenWidthScalar, y: 2658*Global.screenHeightScalar),
        CGPoint(x: 125*Global.screenWidthScalar, y: 2525*Global.screenHeightScalar),
        CGPoint(x: 161*Global.screenWidthScalar, y: 2397*Global.screenHeightScalar),
        CGPoint(x: 202*Global.screenWidthScalar, y: 2270*Global.screenHeightScalar),
        CGPoint(x: 239*Global.screenWidthScalar, y: 2147*Global.screenHeightScalar),
        CGPoint(x: 268*Global.screenWidthScalar, y: 2008*Global.screenHeightScalar),
        CGPoint(x: 286*Global.screenWidthScalar, y: 1871*Global.screenHeightScalar),
        CGPoint(x: 289*Global.screenWidthScalar, y: 1734*Global.screenHeightScalar),
        CGPoint(x: 257*Global.screenWidthScalar, y: 1584*Global.screenHeightScalar),
        CGPoint(x: 203*Global.screenWidthScalar, y: 1441*Global.screenHeightScalar),
        CGPoint(x: 157*Global.screenWidthScalar, y: 1305*Global.screenHeightScalar),
        CGPoint(x: 129*Global.screenWidthScalar, y: 1160*Global.screenHeightScalar),
        CGPoint(x: 133*Global.screenWidthScalar, y: 1008*Global.screenHeightScalar),
        CGPoint(x: 178*Global.screenWidthScalar, y: 862*Global.screenHeightScalar),
        CGPoint(x: 227*Global.screenWidthScalar, y: 722*Global.screenHeightScalar),
        CGPoint(x: 260*Global.screenWidthScalar, y: 590*Global.screenHeightScalar),
        CGPoint(x: 274*Global.screenWidthScalar, y: 459*Global.screenHeightScalar),
        CGPoint(x: 255*Global.screenWidthScalar, y: 317*Global.screenHeightScalar),
        CGPoint(x: 202*Global.screenWidthScalar, y: 179*Global.screenHeightScalar),
        CGPoint(x: 146*Global.screenWidthScalar, y: 64*Global.screenHeightScalar),
        CGPoint(x: 146*Global.screenWidthScalar, y: 3500*Global.screenHeightScalar)
    ]
    
}
