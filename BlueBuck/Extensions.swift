//
//  Extensions.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/16/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

extension UILabel {
    func addTextSpacing(value: CGFloat) {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedStringKey.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
