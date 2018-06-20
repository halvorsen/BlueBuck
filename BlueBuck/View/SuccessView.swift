//
//  SuccessView.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/19/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class Success: UIView {
    
    private var imageview = UIImageView(image: #imageLiteral(resourceName: "success"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageview.contentMode = .scaleAspectFit
        imageview.center = center
        addSubview(imageview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
