//
//  BackView.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/21/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class ButtonView: UIView {
    
    let exit = UIButton()
    let refresh = UIButton()
    let moves = UILabel()

    internal var config: ViewConfig? {
        didSet {
            guard let config = config else { return }
            exit.frame = config.backFrame
            refresh.frame = config.refreshFrame
            if let center = config.movesCenter {
                moves.center = center
            }
            else if let origin = config.movesOrigin {
                moves.frame.origin = origin
            }
            refresh.transform = CGAffineTransform(rotationAngle: config.rotation)
            moves.transform = CGAffineTransform(rotationAngle: config.rotation)
            moves.sizeToFit()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        exit.setImage(#imageLiteral(resourceName: "exit"), for: .normal)
        refresh.setImage(#imageLiteral(resourceName: "restart"), for: .normal)
        moves.text = "0"
        moves.font = UIFont(name: "GothamBold", size: 31)
        moves.textColor = Color.blackLighter2
        addSubview(exit)
        addSubview(refresh)
        addSubview(moves)
        moves.sizeToFit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
