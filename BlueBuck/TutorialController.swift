//
//  TutorialController.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/10/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

protocol TutorialDelegate: class {
    func doneTutorial()
}

enum TutorialScreen {
    case tapToEliminate, createShapes, rotateDevice, tapAgain1, tapAgain2, tapAgain3, returnPhone1, returnPhone2, levelView
}

class TutorialController {
    
    weak var delegate: TutorialDelegate? 
    
    var tutorialView: TutorialView?
    weak var gameView: UIView?
    weak var levelView: UIView?
    var currentTutorialScreen: TutorialScreen = .tapToEliminate {
        didSet {
            setView()
        }
    }
    
    func setTarget(gameView: UIView, levelView: UIView, delegate: TutorialDelegate) {
        
//        if UIScreen.main.bounds.height > 810 {
//            tutorialView = TutorialView(frame: CGRect(x: 0, y: 0, width: 375*Global.screenWidthScalar, height: 667*Global.screenWidthScalar))
//        } else {
            tutorialView = TutorialView(frame: CGRect(x: 0, y: 0, width: 375*Global.screenWidthScalar, height: 667*Global.screenWidthScalar))
//        }
        
        self.delegate = delegate
        self.gameView = gameView
        self.levelView = levelView
        tutorialView?.removeFromSuperview()
        guard let tutorialView = tutorialView else { return }
        self.gameView?.addSubview(tutorialView)
        tutorialView.center = self.gameView!.center
        if UIScreen.main.bounds.height > 810 {
            tutorialView.center.y -= 72.5
        }
//        tutorialView.imageViews[.levelView]!.frame.size = CGSize(width: 375*Global.screenWidthScalar, height: 667*Global.screenWidthScalar)
        self.levelView?.addSubview(tutorialView.imageViews[.levelView]!)
    }
    
    func setClosures(gameViewController: GameViewController) {
        gameViewController.didRotateDevice = { [weak self] orientation in
            guard let weakself = self,
                ![.tapToEliminate, .createShapes, .tapAgain1, .tapAgain2, .tapAgain3].contains(weakself.currentTutorialScreen) else { return }
            
            if [TutorialScreen.returnPhone1, TutorialScreen.returnPhone2].contains(weakself.currentTutorialScreen) && orientation == .portrait {
                weakself.tutorialView?.removeFromSuperview()
                gameViewController.dismiss(animated: true, completion: {
        
                    weakself.currentTutorialScreen = .levelView
          
                    weakself.delegate?.doneTutorial()
                })
                
            } else if weakself.currentTutorialScreen == .rotateDevice && orientation == .landscapeLeft {
                weakself.currentTutorialScreen = .tapAgain1
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                    weakself.currentTutorialScreen = .tapAgain2
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
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
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                    weakself.currentTutorialScreen = .rotateDevice
                })
            } else {
                weakself.currentTutorialScreen = .returnPhone2
            }
        }
    }
    
    func setView() {
        guard let tutorialView = tutorialView else { return }
        for (tutorialScreen, imageView) in tutorialView.imageViews {
            
            if tutorialScreen == currentTutorialScreen {
                imageView.alpha = 1.0
            } else if imageView.alpha == 1.0 {

                imageView.alpha = 0.0
         
            }
        }
        
    }
    
}
