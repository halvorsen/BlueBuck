//
//  EasterEggController.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/20/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

final class EasterEggController {
    
    let controller: LevelsViewController
    let view: LevelsView
    let eggLevel = UIButton()
    let key = UIButton()
    
    init(controller: LevelsViewController, view: LevelsView) {
        self.controller = controller
        self.view = view
        
        eggLevel.frame.size = CGSize(width: 70, height: 70)
        eggLevel.layer.cornerRadius = eggLevel.frame.size.width * 0.5
        eggLevel.layer.borderColor = Color.blue.cgColor
        eggLevel.layer.borderWidth = 4
        eggLevel.clipsToBounds = true
        eggLevel.setImage(#imageLiteral(resourceName: "buckIcon"), for: .normal)
        eggLevel.center = CGPoint(x: view.contentSize.width - 60, y: view.contentSize.height - 60)
        
        key.contentMode = .scaleAspectFit
        key.setImage(#imageLiteral(resourceName: "key"), for: .normal)
        key.frame.size = CGSize(width: 70, height: 70)
        key.center = CGPoint(x: view.contentSize.width - 60, y: view.contentSize.height - 45)
        key.isHidden = false
        
        if MyUser.shared.playerHasUnlockedEasterEgg1 {
        view.addSubview(eggLevel)
        }
        else {
        view.addSubview(key)
            key.isEnabled = false
        }
        if orientation == .portraitUpsideDown {
            key.isEnabled = true
        }
        eggLevel.addTarget(self, action: #selector(eggLevelTouchUpInside(_:)), for: .touchUpInside)
        key.addTarget(self, action: #selector(keyTouchUpInside(_:)), for: .touchUpInside)
        
    }
    
    @objc private func eggLevelTouchUpInside(_ sender: UIButton) {
        controller.loadGame(.levelEgg)
    }
    
    @objc private func keyTouchUpInside(_ sender: UIButton) {
        MyUser.shared.playerHasUnlockedEasterEgg1 = true
        MyUser.shared.writeCurrentUserState()
        key.isHidden = true
        
        eggLevel.center = CGPoint(x: view.contentSize.width - 60, y: view.contentSize.height - 45)
        
        view.addSubview(eggLevel)
    }
    
    var orientation = UIDevice.current.orientation
    internal func orientationDidChange(orientation: UIDeviceOrientation) {
        if orientation == .portraitUpsideDown {
            key.isEnabled = true
        } else {
            key.isEnabled = false
        }
    }
    
}
