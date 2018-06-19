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
    var backFrame = CGRect(x: 129, y: 40, width: 24, height: 24)
    var refreshFrame = CGRect(x: 169, y: 31, width: 40, height: 39)
    var movesOrigin: CGPoint? = nil
    var movesCenter: CGPoint? = CGPoint(x: 237, y: 55)
    var buttonViewFrame = CGRect(x: 0, y: 0, width: 375, height: 70)
    var objectiveFrame = CGRect(x: 0, y: 569, width: 375, height: 98)
    var objectiveCenter1 = CGPoint(x: 112, y: 49)
    var objectiveCenter2 = CGPoint(x: 152, y: 49)
    var objectiveCenter3 = CGPoint(x: 187.5, y: 49)
    var objectiveCenter4 = CGPoint(x: 221, y: 49)
    var objectiveCenter5 = CGPoint(x: 263, y: 49)
    var objectiveCenter2b = CGPoint(x: 149, y: 49)
    var objectiveCenter4b = CGPoint(x: 208, y: 49)
    var popUp = false
    var rotation: CGFloat = 0
    var objectiveCountHorizontalAdjustment: CGFloat = 29
    var objectiveCountVerticalAdjustment: CGFloat = 18
    
}

internal final class Portrait: ViewConfig {
    override init() {
        super.init()
      
    }
}

internal final class PortraitDown: ViewConfig {
    override init() {
        super.init()
        rotation = CGFloat.pi
        movesCenter = CGPoint(x: 237, y: 46)
        objectiveCountHorizontalAdjustment = -29
        objectiveCountVerticalAdjustment = -18
        backFrame = CGRect(x: 129, y: 37, width: 24, height: 24)
    }
}

internal final class LandscapeRight: ViewConfig {
    override init() {
        super.init()
        rotation = CGFloat.pi * -0.5
        movesCenter = CGPoint(x: 237, y: 52)
        objectiveCountHorizontalAdjustment = 32
        objectiveCountVerticalAdjustment = 0
        backFrame = CGRect(x: 129, y: 37, width: 24, height: 24)
    }
}

internal final class LandscapeLeft: ViewConfig {
    override init() {
        super.init()
        rotation = CGFloat.pi * 0.5
        movesCenter = CGPoint(x: 237, y: 52)
        objectiveCountHorizontalAdjustment = -32
        objectiveCountVerticalAdjustment = 0
        backFrame = CGRect(x: 129, y: 37, width: 24, height: 24)
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
