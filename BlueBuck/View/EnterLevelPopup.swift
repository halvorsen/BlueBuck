//
//  EnterLevelPopup.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/31/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

internal final class EnterLevelPopup: UIView {
    
    let title = UILabel()
    let cancel = UIButton()
    let okay = UIButton()
    var centerView = UIView()
    var layoutContraints = [NSLayoutConstraint]()
    
    override init(frame: CGRect) {
    super.init(frame: frame)
        backgroundColor = Color.blackPopup
        layer.cornerRadius = 15
        clipsToBounds = true
        title.text = "Level"
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 20*Global.screenCommonScalar)
        title.textAlignment = .center
        title.textColor = .white
        centerView.backgroundColor = Color.blackLighter1
        addSubview(title)
        addSubview(cancel)
        addSubview(okay)
        addSubview(centerView)
        
        okay.backgroundColor = Color.white
        okay.layer.cornerRadius = 20
        okay.clipsToBounds = true
        okay.setTitle("Okay", for: .normal)
        okay.setTitleColor(Color.black, for: .normal)
        okay.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18*Global.screenCommonScalar)
        cancel.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        cancel.backgroundColor = Color.blackDarker
        
        setupConstraints()
        enableConstraints()
        
    }
    
    private func setupConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints.append(title.centerXAnchor.constraint(equalTo: centerXAnchor))
        layoutContraints.append(title.topAnchor.constraint(equalTo: topAnchor))
        layoutContraints.append(title.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.24))
        
        cancel.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints.append(cancel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.31))
        layoutContraints.append(cancel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.26))
        layoutContraints.append(cancel.leftAnchor.constraint(equalTo: leftAnchor))
        layoutContraints.append(cancel.bottomAnchor.constraint(equalTo: bottomAnchor))
        
        okay.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints.append(okay.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2))
        layoutContraints.append(okay.rightAnchor.constraint(equalTo: rightAnchor, constant: -15*Global.screenCommonScalar))
        layoutContraints.append(okay.leftAnchor.constraint(equalTo: cancel.rightAnchor, constant: 15*Global.screenCommonScalar))
        layoutContraints.append(okay.centerYAnchor.constraint(equalTo: cancel.centerYAnchor))
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints.append(centerView.topAnchor.constraint(equalTo: title.bottomAnchor))
        layoutContraints.append(centerView.bottomAnchor.constraint(equalTo: cancel.topAnchor))
        layoutContraints.append(centerView.leftAnchor.constraint(equalTo: leftAnchor))
        layoutContraints.append(centerView.rightAnchor.constraint(equalTo: rightAnchor))
        
    }
    
    private func enableConstraints() {
        NSLayoutConstraint.activate(layoutContraints)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        enableConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let levelName: [BuckLevel: String] = [
        .level1: "Level 1",
        .level2: "Level 2",
        .level3: "Level 3",
        .level4: "Level 4",
        .level5: "Level 5",
        .level6: "Level 6",
        .level7: "Level 7",
        .level8: "Level 8",
        .level9: "Level 9",
        .level10: "Level 10",
        .level11: "Level 11",
        .level12: "Level 12",
        .level13: "Level 13",
        .level14: "Level 14",
        .level15: "Level 15",
        .level16: "Level 16",
        .level17: "Level 17",
        .level18: "Level 18",
        .level19: "Level 19",
        .level20: "Level 20",
        .level21: "Level 21",
        .level22: "Level 22",
        .levelEgg: "Level 0"
        
    
    ]
}


