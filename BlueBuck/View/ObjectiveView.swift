//
//  ObjectiveView.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/21/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class ObjectiveView: UIView {
    
    var objectives: [SingleObjective] = []
    let objectiveCounts: [UILabel] = [UILabel(),UILabel(),UILabel()]
    let objectiveCompletes: [UIImageView] = [UIImageView(image: #imageLiteral(resourceName: "checkmark")),UIImageView(image: #imageLiteral(resourceName: "checkmark")),UIImageView(image: #imageLiteral(resourceName: "checkmark"))]
    var objectiveCountDimension: CGFloat = 12
    var objectiveVerticleAdjustment: CGFloat = 2
    var objectiveHorizontalAdjustment: CGFloat = 2
    
    internal var config: ViewConfig? {
        didSet {
            guard let config = config else { return }
            switch objectives.count {
            case 1:
                objectives[0].center = config.objectiveCenter3
            case 2:
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
                objectiveCounts[1].frame.origin = CGPoint(x: objectives[1].frame.maxX + objectiveHorizontalAdjustment, y: objectives[1].frame.maxY - objectiveCountDimension + objectiveVerticleAdjustment)
                objectiveCompletes[1].frame.origin = CGPoint(x: objectives[1].frame.maxX + objectiveHorizontalAdjustment, y: objectives[1].frame.maxY - objectiveCountDimension + objectiveVerticleAdjustment)
            case 3:
                objectives[0].center = config.objectiveCenter1
                objectives[1].center = config.objectiveCenter3
                objectives[2].center = config.objectiveCenter5
                objectiveCounts[2].frame.origin = CGPoint(x: objectives[2].frame.maxX + objectiveHorizontalAdjustment, y: objectives[2].frame.maxY - objectiveCountDimension + objectiveVerticleAdjustment)
                objectiveCompletes[2].frame.origin = CGPoint(x: objectives[2].frame.maxX + objectiveHorizontalAdjustment, y: objectives[2].frame.maxY - objectiveCountDimension + objectiveVerticleAdjustment)
            default:
                break
            }
            objectiveCounts[0].frame.origin = CGPoint(x: objectives[0].frame.maxX + objectiveHorizontalAdjustment, y: objectives[0].frame.maxY - objectiveCountDimension + objectiveVerticleAdjustment)
            objectiveCompletes[0].frame.origin = CGPoint(x: objectives[0].frame.maxX + objectiveHorizontalAdjustment, y: objectives[0].frame.maxY - objectiveCountDimension + objectiveVerticleAdjustment)
        }
    }
    
    init(objectiveViews: [SingleObjective]) {
        super.init(frame: CGRect.zero)
        self.objectives = objectiveViews
        for view in objectiveViews {
            addSubview(view)
        }
        
        for label in objectiveCounts {
            label.frame.size = CGSize(width: objectiveCountDimension, height: objectiveCountDimension)
            label.textAlignment = .center
            label.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
            label.textColor = Color.blackLighter2
            label.text = ""
            addSubview(label)
        }
        
        for imageView in objectiveCompletes {
            imageView.frame.size = CGSize(width: 10, height: 10)
            addSubview(imageView)
            imageView.isHidden = true
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
