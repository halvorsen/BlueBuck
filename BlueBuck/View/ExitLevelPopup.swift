//
//  ExitLevelPopup.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/10/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

internal final class ExitLevelPopup: UIView {
    
    let title = UILabel()
    let gameCenter = UIButton()
    let okay = UIButton()
    let thumbsUpImageView = UIImageView(image: #imageLiteral(resourceName: "thumbsUp"))
    var thumbsUpBackground = UIView()
    var layoutContraints = [NSLayoutConstraint]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Color.blackPopup
        layer.cornerRadius = 15*Global.screenCommonScalar
        clipsToBounds = true
        title.text = "14 Moves"
        title.font = UIFont(name: "HelveticaNeue-Bold", size: 20*Global.screenCommonScalar)
        title.textAlignment = .center
        title.textColor = .white
        thumbsUpBackground.backgroundColor = Color.blackDarker
        addSubview(title)
        addSubview(gameCenter)
        addSubview(okay)
        addSubview(thumbsUpBackground)
        addSubview(thumbsUpImageView)
        
        okay.backgroundColor = Color.white
        okay.layer.cornerRadius = 20*Global.screenCommonScalar
        okay.clipsToBounds = true
        okay.setTitle("Continue", for: .normal)
        okay.setTitleColor(Color.black, for: .normal)
        okay.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18*Global.screenCommonScalar)
        gameCenter.setImage(#imageLiteral(resourceName: "gameCenter"), for: .normal)
        gameCenter.backgroundColor = Color.blackDarker
        
        setupConstraints()
        enableConstraints()
        
    }
    
    private func setupConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints.append(title.topAnchor.constraint(equalTo: topAnchor))
        layoutContraints.append(title.bottomAnchor.constraint(equalTo: gameCenter.topAnchor))
        layoutContraints.append(title.rightAnchor.constraint(equalTo: thumbsUpBackground.leftAnchor))
        layoutContraints.append(title.leftAnchor.constraint(equalTo: leftAnchor))
        
        gameCenter.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints.append( gameCenter.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4))
        layoutContraints.append( gameCenter.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.26))
        layoutContraints.append( gameCenter.leftAnchor.constraint(equalTo: leftAnchor))
        layoutContraints.append( gameCenter.bottomAnchor.constraint(equalTo: bottomAnchor))
        
        okay.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints.append(okay.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.26))
        layoutContraints.append(okay.rightAnchor.constraint(equalTo: rightAnchor, constant: -15*Global.screenCommonScalar))
        layoutContraints.append(okay.leftAnchor.constraint(equalTo:  gameCenter.rightAnchor, constant: 15*Global.screenCommonScalar))
        layoutContraints.append(okay.centerYAnchor.constraint(equalTo:  gameCenter.centerYAnchor))
        
        thumbsUpBackground.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints.append(thumbsUpBackground.topAnchor.constraint(equalTo: topAnchor))
        layoutContraints.append(thumbsUpBackground.bottomAnchor.constraint(equalTo:  gameCenter.topAnchor))
        layoutContraints.append(thumbsUpBackground.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.295))
        layoutContraints.append(thumbsUpBackground.rightAnchor.constraint(equalTo: rightAnchor))
        
        thumbsUpImageView.translatesAutoresizingMaskIntoConstraints = false
        layoutContraints.append(thumbsUpImageView.centerXAnchor.constraint(equalTo: thumbsUpBackground.centerXAnchor))
        layoutContraints.append(thumbsUpImageView.centerYAnchor.constraint(equalTo: thumbsUpBackground.centerYAnchor))
        
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
