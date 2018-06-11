//
//  TutorialController.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/10/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

protocol TutorialDelegate: class {
    func loadGame(_ level: BuckLevel)
}

enum TutorialScreen {
    case tapToEliminate, createShapes, rotateDevice, tapAgain1, tapAgain2, tapAgain3, returnPhone1, returnPhone2, levelView
}

class TutorialController {
    
    var delegate: TutorialDelegate?
    
    let tutorialView = TutorialView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
    var gameView = UIView()
    var levelView = UIView()
    var currentTutorialScreen: TutorialScreen = .tapToEliminate {
        didSet {
            setView()
        }
    }

    func setTarget(gameView: UIView, levelView: UIView) {
        self.gameView = gameView
        self.levelView = levelView
        tutorialView.removeFromSuperview()
        self.gameView.addSubview(tutorialView)
    }
    
    func setClosures(gameViewController: GameViewController) {
        gameViewController.didRotateDevice = { [weak self] orientation in
            guard let weakself = self else { return }
 
            if [TutorialScreen.returnPhone1, TutorialScreen.returnPhone2].contains(weakself.currentTutorialScreen) && orientation == .portrait {
                gameViewController.dismiss(animated: true, completion: {
                    weakself.currentTutorialScreen = .levelView
                    weakself.delegate?.loadGame(.level1)
                })
                
            } else if weakself.currentTutorialScreen == .rotateDevice && orientation == .landscapeLeft {
                weakself.currentTutorialScreen = .tapAgain1
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                    weakself.currentTutorialScreen = .tapAgain2
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                        weakself.currentTutorialScreen = .tapAgain3
                        if orientation == .landscapeLeft {
                        gameViewController.baseView.isUserInteractionEnabled = true
                        }
                    })
                })
            } else if [TutorialScreen.tapAgain1, TutorialScreen.tapAgain2, TutorialScreen.tapAgain3].contains(weakself.currentTutorialScreen) && orientation == .landscapeLeft {
                gameViewController.baseView.isUserInteractionEnabled = true
            } else {
                gameViewController.baseView.isUserInteractionEnabled = false
            }
        }
        
        gameViewController.scene.didTapOnBlock = { [weak self] block in

            guard let weakself = self else { return }
            if weakself.currentTutorialScreen == .tapToEliminate {
                weakself.currentTutorialScreen = .createShapes
            } else if [UIDeviceOrientation.landscapeLeft, UIDeviceOrientation.landscapeRight].contains(gameViewController.orientation) {
                weakself.currentTutorialScreen = .returnPhone1
            }
            gameViewController.baseView.isUserInteractionEnabled = false
        }
        
        gameViewController.scene.didFinishAnimateBlocks = { [weak self] in
            guard let weakself = self else { return }
            if weakself.currentTutorialScreen == .createShapes {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                    weakself.currentTutorialScreen = .rotateDevice
                })
            } else {
                weakself.currentTutorialScreen = .returnPhone2
            }
        }
    }
    
    func setView() {
        
        for (tutorialScreen, imageView) in tutorialView.imageViews {
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let weakself = self else { return }
                if tutorialScreen == weakself.currentTutorialScreen {
                    imageView.alpha = 1.0
                } else {
                    imageView.alpha = 0.0
                }
            }
            
        }
        
    }

}
