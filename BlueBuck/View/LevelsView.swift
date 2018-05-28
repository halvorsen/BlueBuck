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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Color.black
        for _ in 0..<buttonLocations.count {
            buttons.append(UIButton())
        }
        showsVerticalScrollIndicator = false
        contentSize = CGSize(width: 375, height: 3000)
        levelBackgroundView.frame = CGRect(origin: CGPoint.zero, size: contentSize)
        addSubview(levelBackgroundView)
        for i in 0..<buttons.count {
            
            buttons[i].setTitle("\(i + 1)", for: .normal)
            buttons[i].titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
            buttons[i].setTitleColor(Color.blue, for: .normal)
            buttons[i].frame.size = CGSize(width: 53, height: 53)
            buttons[i].layer.cornerRadius = buttons[i].frame.size.width * 0.5
            buttons[i].layer.borderColor = Color.blue.cgColor
            buttons[i].layer.borderWidth = 4
            buttons[i].clipsToBounds = true
            buttons[i].tag = i
            buttons[i].backgroundColor = Color.white
            buttons[i].center = buttonLocations[i]
        }
      
        contentOffset.y = contentSize.height - 667
        for button in buttons {
            addSubview(button)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let buttonLocations: [CGPoint] = [
    CGPoint(x: 81, y: 2940),
    CGPoint(x: 81, y: 2791),
    CGPoint(x: 94, y: 2658),
    CGPoint(x: 125, y: 2525),
    CGPoint(x: 161, y: 2397),
    CGPoint(x: 202, y: 2270),
    CGPoint(x: 239, y: 2147),
    CGPoint(x: 268, y: 2008),
    CGPoint(x: 286, y: 1871),
    CGPoint(x: 289, y: 1734),
    CGPoint(x: 257, y: 1584),
    CGPoint(x: 203, y: 1441),
    CGPoint(x: 157, y: 1305),
    CGPoint(x: 129, y: 1160),
    CGPoint(x: 133, y: 1008),
    CGPoint(x: 178, y: 862),
    CGPoint(x: 227, y: 722),
    CGPoint(x: 260, y: 590),
    CGPoint(x: 274, y: 459),
    CGPoint(x: 255, y: 317),
    CGPoint(x: 202, y: 179),
    CGPoint(x: 146, y: 64),
    CGPoint(x: 146, y: 3500)
    ]
    
}
