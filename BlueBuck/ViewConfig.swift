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
    var backFrame = CGRect(x: 129*Global.screenWidthScalar, y: 40*Global.screenWidthScalar, width: 24*Global.screenWidthScalar, height: 24*Global.screenWidthScalar)
    var refreshFrame = CGRect(x: 169*Global.screenWidthScalar, y: 31*Global.screenWidthScalar, width: 40*Global.screenWidthScalar, height: 39*Global.screenWidthScalar)
    var movesOrigin: CGPoint? = nil
    var movesCenter: CGPoint? = CGPoint(x: 237*Global.screenWidthScalar, y: 55*Global.screenWidthScalar)
    
    var objectiveFrame = CGRect(x: 0, y: 569*Global.screenWidthScalar, width: 375*Global.screenWidthScalar, height: 98*Global.screenWidthScalar)
    var objectiveCenter1 = CGPoint(x: 112*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
    var objectiveCenter2 = CGPoint(x: 152*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
    var objectiveCenter3 = CGPoint(x: 187.5*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
    var objectiveCenter4 = CGPoint(x: 221*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
    var objectiveCenter5 = CGPoint(x: 263*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
    var objectiveCenter2b = CGPoint(x: 149*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
    var objectiveCenter4b = CGPoint(x: 208*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
    var popUp = false
    var rotation: CGFloat = 0
    var objectiveCountHorizontalAdjustment: CGFloat = 29*Global.screenWidthScalar
    var objectiveCountVerticalAdjustment: CGFloat = 18*Global.screenWidthScalar
    
}

internal final class Portrait: ViewConfig {
    override init() {
        super.init()
        if UIScreen.main.bounds.height > 810 {
            objectiveFrame = CGRect(x: 0, y: 648, width: 375*Global.screenWidthScalar, height: 98*Global.screenWidthScalar)
        }
    }
}

internal final class PortraitDown: ViewConfig {
    override init() {
        super.init()
        rotation = CGFloat.pi
        movesCenter = CGPoint(x: 237*Global.screenWidthScalar, y: 46*Global.screenWidthScalar)
        objectiveCountHorizontalAdjustment = -29*Global.screenWidthScalar
        objectiveCountVerticalAdjustment = -18*Global.screenWidthScalar
        backFrame = CGRect(x: 129*Global.screenWidthScalar, y: 37*Global.screenWidthScalar, width: 24*Global.screenWidthScalar, height: 24*Global.screenWidthScalar)
        if UIScreen.main.bounds.height > 810 {
            objectiveFrame = CGRect(x: 0, y: 648, width: 375*Global.screenWidthScalar, height: 98*Global.screenWidthScalar)
        }
    }
}

internal final class LandscapeRight: ViewConfig {
    override init() {
        super.init()
        rotation = CGFloat.pi * -0.5
        movesCenter = CGPoint(x: 237*Global.screenWidthScalar, y: 52*Global.screenWidthScalar)
        objectiveCountHorizontalAdjustment = 32*Global.screenWidthScalar
        objectiveCountVerticalAdjustment = 0
        backFrame = CGRect(x: 129*Global.screenWidthScalar, y: 37*Global.screenWidthScalar, width: 24*Global.screenWidthScalar, height: 24*Global.screenWidthScalar)
        if UIScreen.main.bounds.height > 810 {
            objectiveFrame = CGRect(x: 0, y: 648, width: 375*Global.screenWidthScalar, height: 98*Global.screenWidthScalar)
        }
    }
}

internal final class LandscapeLeft: ViewConfig {
    override init() {
        super.init()
        rotation = CGFloat.pi * 0.5
        movesCenter = CGPoint(x: 237*Global.screenWidthScalar, y: 52*Global.screenWidthScalar)
        objectiveCountHorizontalAdjustment = -32*Global.screenWidthScalar
        objectiveCountVerticalAdjustment = 0
        backFrame = CGRect(x: 129*Global.screenWidthScalar, y: 37*Global.screenWidthScalar, width: 24*Global.screenWidthScalar, height: 24*Global.screenWidthScalar)
        if UIScreen.main.bounds.height > 810 {
            objectiveFrame = CGRect(x: 0, y: 648, width: 375*Global.screenWidthScalar, height: 98*Global.screenWidthScalar)
        }
    }
}

internal final class Popup: ViewConfig {
    override init() {
        super.init()
        objectiveCenter1 = CGPoint(x: 62*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
        objectiveCenter2 = CGPoint(x: 102*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
        objectiveCenter2b = CGPoint(x: 99*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
        objectiveCenter3 = CGPoint(x: 137.5*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
        objectiveCenter4 = CGPoint(x: 171*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
        objectiveCenter4b = CGPoint(x: 158*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
        objectiveCenter5 = CGPoint(x: 213*Global.screenWidthScalar, y: 49*Global.screenWidthScalar)
        popUp = true
    }
}
