//
//  ObjectiveView.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/21/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class ObjectiveView: UIView {
    
    var objectives: [SingleObjective] = []
    let objectiveCounts: [UILabel] = [UILabel(),UILabel(),UILabel()]
    let objectiveCompletes: [UIImageView] = [UIImageView(image: #imageLiteral(resourceName: "checkmark")),UIImageView(image: #imageLiteral(resourceName: "checkmark")),UIImageView(image: #imageLiteral(resourceName: "checkmark"))]

    
    internal var config: ViewConfig? = Portrait() {
        didSet {
           guard let config = config else { return }
            
            switch objectives.count {
            case 1:
                objectives[0].center = config.objectiveCenter3
            case 2:
                objectives[1].popUp = config.popUp
                if !objectives[1].square[0] && !objectives[1].square[3] && !objectives[1].square[6] {
                    objectives[1].center = config.objectiveCenter4b
                } else {
                    objectives[1].center = config.objectiveCenter4
                }
                if !objectives[0].square[0] && !objectives[0].square[3] && !objectives[0].square[6] {
                    objectives[0].center = config.objectiveCenter2b
                } else {
                    objectives[0].center = config.objectiveCenter2
                }
                objectiveCounts[1].center = CGPoint(x: objectives[1].center.x + config.objectiveCountHorizontalAdjustment, y: objectives[1].center.y + config.objectiveCountVerticalAdjustment)
                objectiveCompletes[1].center = CGPoint(x: objectives[1].center.x + config.objectiveCountHorizontalAdjustment, y: objectives[1].center.y + config.objectiveCountVerticalAdjustment)
            case 3:
                objectives[1].popUp = config.popUp
                objectives[2].popUp = config.popUp
                objectives[0].center = config.objectiveCenter1
                objectives[1].center = config.objectiveCenter3
                objectives[2].center = config.objectiveCenter5
                objectiveCounts[1].center = CGPoint(x: objectives[1].center.x + config.objectiveCountHorizontalAdjustment, y: objectives[1].center.y + config.objectiveCountVerticalAdjustment)
                objectiveCompletes[1].center = CGPoint(x: objectives[1].center.x + config.objectiveCountHorizontalAdjustment, y: objectives[1].center.y + config.objectiveCountVerticalAdjustment)
                objectiveCounts[2].center = CGPoint(x: objectives[2].center.x + config.objectiveCountHorizontalAdjustment, y: objectives[2].center.y + config.objectiveCountVerticalAdjustment)
                objectiveCompletes[2].center = CGPoint(x: objectives[2].center.x + config.objectiveCountHorizontalAdjustment, y: objectives[2].center.y + config.objectiveCountVerticalAdjustment)
            default:
                break
            }
            objectiveCounts[0].center = CGPoint(x: objectives[0].center.x + config.objectiveCountHorizontalAdjustment, y: objectives[0].center.y + config.objectiveCountVerticalAdjustment)
            objectiveCompletes[0].center = CGPoint(x: objectives[0].center.x + config.objectiveCountHorizontalAdjustment, y: objectives[0].center.y + config.objectiveCountVerticalAdjustment)
            objectives[0].popUp = config.popUp
            
            for objectiveLabel in objectiveCounts {
                objectiveLabel.transform = CGAffineTransform(rotationAngle: config.rotation)
                objectiveLabel.sizeToFit()
            }
        }
    }
    
    init(objectiveViews: [SingleObjective]) {
        super.init(frame: CGRect.zero)
        self.objectives = objectiveViews
        for view in objectiveViews {
            addSubview(view)
        }
        
        for label in objectiveCounts {
            label.textAlignment = .center
            label.font = UIFont(name: "GothamBold", size: 12*Global.screenWidthScalar)
            label.textColor = Color.blackLighter2
            label.text = " "
            label.sizeToFit()
            addSubview(label)
        }
        
        for imageView in objectiveCompletes {
            imageView.frame.size = CGSize(width: 10*Global.screenWidthScalar, height: 10*Global.screenWidthScalar)
            addSubview(imageView)
            imageView.isHidden = true
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
