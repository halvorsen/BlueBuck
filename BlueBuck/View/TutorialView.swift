//
//  TutorialView.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/10/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class TutorialView: UIView {
    internal let imageViews: [TutorialScreen: UIImageView] = [
        .tapToEliminate: UIImageView(image: #imageLiteral(resourceName: "Tutorial1")),
        .createShapes: UIImageView(image: #imageLiteral(resourceName: "Tutorial2")),
        .rotateDevice: UIImageView(image: #imageLiteral(resourceName: "Tutorial5")),
        .tapAgain1: UIImageView(image: #imageLiteral(resourceName: "Tutorial6a")),
        .tapAgain2: UIImageView(image: #imageLiteral(resourceName: "Tutorial6b")),
        .tapAgain3: UIImageView(image: #imageLiteral(resourceName: "Tutorial6c")),
        .returnPhone1: UIImageView(image: #imageLiteral(resourceName: "Tutorial7a")),
        .returnPhone2: UIImageView(image: #imageLiteral(resourceName: "Tutorial7b")),
        .levelView: UIImageView(image: #imageLiteral(resourceName: "Tutorial8"))
        
        ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        for (screen, imageView) in imageViews {
            imageView.center = center
            if screen != .tapToEliminate && screen != .levelView {
            imageView.alpha = 0.0
            }
            if screen != .levelView {
            addSubview(imageView)
            }
            imageView.isUserInteractionEnabled = false
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
