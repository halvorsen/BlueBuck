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
    
    internal var config: ViewConfig? {
        didSet {
            guard let config = config else { return }
            switch objectives.count {
            case 1:
                objectives[0].center = config.objectiveCenter3
            case 2:
                objectives[0].center = config.objectiveCenter2
                objectives[1].center = config.objectiveCenter4
            case 3:
                objectives[0].center = config.objectiveCenter1
                objectives[1].center = config.objectiveCenter3
                objectives[2].center = config.objectiveCenter5
            default:
                break
            }
            
        }
    }
    
    init(objectiveViews: [SingleObjective]) {
        super.init(frame: CGRect.zero)
        self.objectives = objectiveViews
        for view in objectiveViews {
        addSubview(view)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
