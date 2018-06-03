//
//  BackViewConfig.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/21/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit
// ##NOTE: Some of the patterns still dont align properly if they only have two columns
internal class ViewConfig {
    var backFrame = CGRect.zero
    var refreshFrame = CGRect.zero
    var movesFrame = CGRect.zero
    var buttonViewFrame = CGRect.zero
    var objectiveFrame = CGRect.zero
    var refreshRotation: CGFloat = 0
    var objectiveCenter1 = CGPoint.zero
    var objectiveCenter2 = CGPoint.zero
    var objectiveCenter3 = CGPoint.zero
    var objectiveCenter4 = CGPoint.zero
    var objectiveCenter5 = CGPoint.zero
    var objectiveCenter2b = CGPoint.zero
    var objectiveCenter4b = CGPoint.zero
    var popUp = false
}

internal final class Portrait: ViewConfig {
    override init() {
        super.init()
        backFrame = CGRect(x: 129, y: 40, width: 24, height: 24)
        refreshFrame = CGRect(x: 169, y: 31, width: 40, height: 39)
        movesFrame = CGRect(x: 223, y: 37, width: 90, height: 35)
        buttonViewFrame = CGRect(x: 0, y: 0, width: 375, height: 70)
        objectiveFrame = CGRect(x: 0, y: 569, width: 375, height: 98)
        objectiveCenter1 = CGPoint(x: 112, y: 49)
        objectiveCenter2 = CGPoint(x: 152, y: 49)
        objectiveCenter2b = CGPoint(x: 149, y: 49)
        objectiveCenter3 = CGPoint(x: 187.5, y: 49)
        objectiveCenter4 = CGPoint(x: 221, y: 49)
        objectiveCenter4b = CGPoint(x: 208, y: 49)
        objectiveCenter5 = CGPoint(x: 263, y: 49)
        
        
    }
}

internal final class Landscape: ViewConfig {
    override init() {
        super.init()
        backFrame = CGRect(x: 25, y: 271, width: 24, height: 24)
        refreshFrame = CGRect(x: 18, y: 313, width: 40, height: 39)
        movesFrame = CGRect(x: 27, y: 367, width: 90, height: 28)
        buttonViewFrame = CGRect(x: 0, y: 0, width: 667, height: 70)
        objectiveFrame = CGRect(x: 304, y: 0, width: 667, height: 71)
        refreshRotation = CGFloat.pi*0.5
        objectiveCenter1 = CGPoint(x: 112, y: 49)
        objectiveCenter2 = CGPoint(x: 152, y: 49)
        objectiveCenter2b = CGPoint(x: 149, y: 49)
        objectiveCenter3 = CGPoint(x: 187.5, y: 49)
        objectiveCenter4 = CGPoint(x: 221, y: 49)
        objectiveCenter4b = CGPoint(x: 208, y: 49)
        objectiveCenter5 = CGPoint(x: 263, y: 49)
    }
}

internal final class Popup: ViewConfig {
    override init() {
        super.init()
        objectiveCenter1 = CGPoint(x: 62, y: 49)
        objectiveCenter2 = CGPoint(x: 102, y: 49)
        objectiveCenter2b = CGPoint(x: 99, y: 49)
        objectiveCenter3 = CGPoint(x: 137.5, y: 49)
        objectiveCenter4 = CGPoint(x: 171, y: 49)
        objectiveCenter4b = CGPoint(x: 158, y: 49)
        objectiveCenter5 = CGPoint(x: 213, y: 49)
        popUp = true
    }
}
