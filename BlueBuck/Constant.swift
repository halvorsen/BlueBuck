//
//  Constant.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/13/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

internal struct Color {
    
    internal static let blue = UIColor(red: 76/255, green: 193/255, blue: 252/255, alpha: 1.0)
    internal static let pink = UIColor(red: 255/255, green: 76/255, blue: 188/255, alpha: 1.0)
    internal static let yellow = UIColor(red: 255/255, green: 237/255, blue: 102/255, alpha: 1.0)
    internal static let green = UIColor(red: 140/255, green: 224/255, blue: 135/255, alpha: 1.0)
    internal static let white = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
    
    internal static let black = UIColor(red: 59/255, green: 59/255, blue: 59/255, alpha: 1.0)
    internal static let blackPopup = UIColor(red: 57/255, green: 57/255, blue: 57/255, alpha: 1.0)
    internal static let blackLighter1 = UIColor(red: 72/255, green: 72/255, blue: 72/255, alpha: 1.0)
    internal static let blackLighter2 = UIColor(red: 87/255, green: 87/255, blue: 87/255, alpha: 1.0)
    internal static let blackDarker = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
    
}

internal struct Path {
    internal static let big = CGPath(rect: CGRect(x: 0, y: 0, width: 33*Global.screenCommonScalar, height: 33*Global.screenCommonScalar), transform: nil)
    internal static let small = CGPath(rect: CGRect(x: 0, y: 0, width: 14*Global.screenCommonScalar, height: 14*Global.screenCommonScalar), transform: nil)
}

internal struct Global {
    internal static var screenCommonScalar: CGFloat = UIScreen.main.bounds.width/375
    internal static let screenHeightScalar: CGFloat = UIScreen.main.bounds.height/667
    internal static let screenWidthScalar: CGFloat = UIScreen.main.bounds.width/375
    
}
