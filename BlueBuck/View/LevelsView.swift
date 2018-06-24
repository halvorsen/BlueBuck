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
        contentSize = CGSize(width: 375*Global.screenWidthScalar, height: 3000*Global.screenWidthScalar)
        
       
        levelBackgroundView.frame = CGRect(origin: CGPoint.zero, size: contentSize)
        if UIScreen.main.bounds.height > 810 {
            contentSize = CGSize(width: 375*Global.screenWidthScalar, height: 2970)
        }
        addSubview(levelBackgroundView)
        for i in 0..<buttons.count {
            
            buttons[i].setTitle("\(i + 1)", for: .normal)
            buttons[i].titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18*Global.screenWidthScalar)
            buttons[i].setTitleColor(Color.blue, for: .normal)
            buttons[i].frame.size = CGSize(width: 53*Global.screenWidthScalar, height: 53*Global.screenWidthScalar)
            buttons[i].layer.cornerRadius = buttons[i].frame.size.width * 0.5
            buttons[i].layer.borderColor = Color.blue.cgColor
            buttons[i].layer.borderWidth = 4
            buttons[i].clipsToBounds = true
            buttons[i].tag = i
            buttons[i].backgroundColor = Color.white
            buttons[i].center = buttonLocations[i]
            if i > 14 && !MyUser.shared.playerHasPaid {
                buttons[i].setTitle("🔒", for: .normal)
            }
         
        }
        
        setScoreLabels()
      
        contentOffset.y = contentSize.height - 667*Global.screenWidthScalar
        if UIScreen.main.bounds.height > 810 {
            contentOffset.y = contentSize.height - 730*Global.screenWidthScalar
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
            scoreLabels[i].font = UIFont(name: "GothamBold", size: 18*Global.screenWidthScalar)
            
            scoreLabels[i].frame.origin = buttons[i].center
            scoreLabels[i].frame.origin.x += 45*Global.screenWidthScalar
            scoreLabels[i].frame.origin.y += 15*Global.screenWidthScalar
            scoreLabels[i].addTextSpacing(value: 1.77*Global.screenWidthScalar)
            scoreLabels[i].sizeToFit()
            addSubview(scoreLabels[i])
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let buttonLocations: [CGPoint] = [
    CGPoint(x: 81*Global.screenWidthScalar, y: 2910*Global.screenWidthScalar),
    CGPoint(x: 81*Global.screenWidthScalar, y: 2785*Global.screenWidthScalar),
    CGPoint(x: 94*Global.screenWidthScalar, y: 2658*Global.screenWidthScalar),
    CGPoint(x: 125*Global.screenWidthScalar, y: 2525*Global.screenWidthScalar),
    CGPoint(x: 161*Global.screenWidthScalar, y: 2397*Global.screenWidthScalar),
    CGPoint(x: 202*Global.screenWidthScalar, y: 2270*Global.screenWidthScalar),
    CGPoint(x: 239*Global.screenWidthScalar, y: 2147*Global.screenWidthScalar),
    CGPoint(x: 268*Global.screenWidthScalar, y: 2008*Global.screenWidthScalar),
    CGPoint(x: 286*Global.screenWidthScalar, y: 1871*Global.screenWidthScalar),
    CGPoint(x: 289*Global.screenWidthScalar, y: 1734*Global.screenWidthScalar),
    CGPoint(x: 257*Global.screenWidthScalar, y: 1584*Global.screenWidthScalar),
    CGPoint(x: 203*Global.screenWidthScalar, y: 1441*Global.screenWidthScalar),
    CGPoint(x: 157*Global.screenWidthScalar, y: 1305*Global.screenWidthScalar),
    CGPoint(x: 129*Global.screenWidthScalar, y: 1160*Global.screenWidthScalar),
    CGPoint(x: 133*Global.screenWidthScalar, y: 1008*Global.screenWidthScalar),
    CGPoint(x: 178*Global.screenWidthScalar, y: 862*Global.screenWidthScalar),
    CGPoint(x: 227*Global.screenWidthScalar, y: 722*Global.screenWidthScalar),
    CGPoint(x: 260*Global.screenWidthScalar, y: 590*Global.screenWidthScalar),
    CGPoint(x: 274*Global.screenWidthScalar, y: 459*Global.screenWidthScalar),
    CGPoint(x: 255*Global.screenWidthScalar, y: 317*Global.screenWidthScalar),
    CGPoint(x: 202*Global.screenWidthScalar, y: 179*Global.screenWidthScalar),
    CGPoint(x: 146*Global.screenWidthScalar, y: 64*Global.screenWidthScalar),
    CGPoint(x: 146*Global.screenWidthScalar, y: 3500*Global.screenWidthScalar)
    ]
    
}
