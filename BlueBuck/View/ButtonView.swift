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
//    let objectiveView = ObjectiveView()
    
    internal var config: ViewConfig? {
        didSet {
            guard let config = config else { return }
            exit.frame = config.backFrame
            refresh.frame = config.refreshFrame
            moves.frame = config.movesFrame
//            objectiveView.frame = config.objectiveFrame
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        exit.setImage(#imageLiteral(resourceName: "exit"), for: .normal)
        refresh.setImage(#imageLiteral(resourceName: "restart"), for: .normal)
        moves.text = "31"
        moves.font = UIFont(name: "GothamBold", size: 31)
        moves.textColor = Color.blackLighter2
        addSubview(exit)
        addSubview(refresh)
        addSubview(moves)
//        addSubview(objectiveView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
