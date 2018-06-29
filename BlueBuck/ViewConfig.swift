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
    var backFrame = CGRect(x: 129*Global.screenCommonScalar, y: 40*Global.screenCommonScalar, width: 24*Global.screenCommonScalar, height: 24*Global.screenCommonScalar)
    var refreshFrame = CGRect(x: 169*Global.screenCommonScalar, y: 31*Global.screenCommonScalar, width: 40*Global.screenCommonScalar, height: 39*Global.screenCommonScalar)
    var movesOrigin: CGPoint? = nil
    var movesCenter: CGPoint? = CGPoint(x: 237*Global.screenCommonScalar, y: 55*Global.screenCommonScalar)
    
    var objectiveFrame = CGRect(x: 0, y: 569*Global.screenCommonScalar, width: 375*Global.screenCommonScalar, height: 98*Global.screenCommonScalar)
    var objectiveCenter1 = CGPoint(x: 112*Global.screenCommonScalar, y: 49*Global.screenCommonScalar)
    var objectiveCenter2 = CGPoint(x: 152*Global.screenCommonScalar, y: 49*Global.screenCommonScalar)
    var objectiveCenter3 = CGPoint(x: 187.5*Global.screenCommonScalar, y: 49*Global.screenCommonScalar)
    var objectiveCenter4 = CGPoint(x: 221*Global.screenCommonScalar, y: 49*Global.screenCommonScalar)
    var objectiveCenter5 = CGPoint(x: 263*Global.screenCommonScalar, y: 49*Global.screenCommonScalar)
    var objectiveCenter2b = CGPoint(x: 149*Global.screenCommonScalar, y: 49*Global.screenCommonScalar)
    var objectiveCenter4b = CGPoint(x: 208*Global.screenCommonScalar, y: 49*Global.screenCommonScalar)
    var popUp = false
    var rotation: CGFloat = 0
    var objectiveCountHorizontalAdjustment: CGFloat = 29*Global.screenCommonScalar
    var objectiveCountVerticalAdjustment: CGFloat = 18*Global.screenCommonScalar
    
}

internal final class Portrait: ViewConfig {
    override init() {
        super.init()
        if UIScreen.main.bounds.height > 810 {
            objectiveFrame = CGRect(x: 0, y: 648, width: 375*Global.screenCommonScalar, height: 98*Global.screenCommonScalar)
        }
    }
}

internal final class PortraitDown: ViewConfig {
    override init() {
        super.init()
        rotation = CGFloat.pi
        movesCenter = CGPoint(x: 237*Global.screenCommonScalar, y: 46*Global.screenCommonScalar)
        objectiveCountHorizontalAdjustment = -29*Global.screenCommonScalar
        objectiveCountVerticalAdjustment = -18*Global.screenCommonScalar
        backFrame = CGRect(x: 129*Global.screenCommonScalar, y: 37*Global.screenCommonScalar, width: 24*Global.screenCommonScalar, height: 24*Global.screenCommonScalar)
        if UIScreen.main.bounds.height > 810 {
            objectiveFrame = CGRect(x: 0, y: 648, width: 375*Global.screenCommonScalar, height: 98*Global.screenCommonScalar)
        }
    }
}

internal final class LandscapeRight: ViewConfig {
    override init() {
        super.init()
        rotation = CGFloat.pi * -0.5
        movesCenter = CGPoint(x: 237*Global.screenCommonScalar, y: 52*Global.screenCommonScalar)
        objectiveCountHorizontalAdjustment = 32*Global.screenCommonScalar
        objectiveCountVerticalAdjustment = 0
        backFrame = CGRect(x: 129*Global.screenCommonScalar, y: 37*Global.screenCommonScalar, width: 24*Global.screenCommonScalar, height: 24*Global.screenCommonScalar)
        if UIScreen.main.bounds.height > 810 {
            objectiveFrame = CGRect(x: 0, y: 648, width: 375*Global.screenCommonScalar, height: 98*Global.screenCommonScalar)
        }
    }
}

internal final class LandscapeLeft: ViewConfig {
    override init() {
        super.init()
        rotation = CGFloat.pi * 0.5
        movesCenter = CGPoint(x: 237*Global.screenCommonScalar, y: 52*Global.screenCommonScalar)
        objectiveCountHorizontalAdjustment = -32*Global.screenCommonScalar
        objectiveCountVerticalAdjustment = 0
        backFrame = CGRect(x: 129*Global.screenCommonScalar, y: 37*Global.screenCommonScalar, width: 24*Global.screenCommonScalar, height: 24*Global.screenCommonScalar)
        if UIScreen.main.bounds.height > 810 {
            objectiveFrame = CGRect(x: 0, y: 648, width: 375*Global.screenCommonScalar, height: 98*Global.screenCommonScalar)
        }
    }
}

internal final class Popup: ViewConfig {
    override init() {
        super.init()
        objectiveCenter1 = CGPoint(x: 62*Global.screenWidthScalar, y: 49*Global.screenCommonScalar)
        objectiveCenter2 = CGPoint(x: 102*Global.screenWidthScalar, y: 49*Global.screenCommonScalar)
        objectiveCenter2b = CGPoint(x: 99*Global.screenWidthScalar, y: 49*Global.screenCommonScalar)
        objectiveCenter3 = CGPoint(x: 137.5*Global.screenWidthScalar, y: 49*Global.screenCommonScalar)
        objectiveCenter4 = CGPoint(x: 171*Global.screenWidthScalar, y: 49*Global.screenCommonScalar)
        objectiveCenter4b = CGPoint(x: 158*Global.screenWidthScalar, y: 49*Global.screenCommonScalar)
        objectiveCenter5 = CGPoint(x: 213*Global.screenWidthScalar, y: 49*Global.screenCommonScalar)
        popUp = true
    }
}
