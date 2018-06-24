//
//  SingleObjective.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/22/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class SingleObjective: UIView {
    
    var square: [Bool]
    var squareView = [Square]()
    var popUp = false {
        didSet {
            if popUp {
                for square in squareView {
                    square.color = Color.white
                }
            }
        }
    }
    
    init(square: [Bool]) {
        self.square = square
        super.init(frame: CGRect(x: 0, y: 0, width: 44*Global.screenWidthScalar, height: 44*Global.screenWidthScalar))
        for i in 0...2 {
            for j in 0...2 {
                let k = i*3 + j
                if square.count > k {
                    if square[k] {
                        let newSquare = Square(frame: CGRect(x: CGFloat(j)*17*Global.screenWidthScalar, y: CGFloat(i)*17*Global.screenWidthScalar, width: 10*Global.screenWidthScalar, height: 10*Global.screenWidthScalar))
                        if popUp {
                            newSquare.color = Color.white
                        }
                        squareView.append(newSquare)
                        addSubview(newSquare)
                    }
                }
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}

final class Square: UIView {
    var color = Color.blackLighter2
    override func draw(_ rect: CGRect) {
        var path = UIBezierPath()
        path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        color.setFill()
        path.fill()
    }
}
