//
//  GameViewController.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/12/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameViewController: UIViewController, GameSceneDelegate, UIGestureRecognizerDelegate {
    
    private var scene = GameScene()
    private var gameView = GameView()
    private var buttonView = ButtonView()
    internal var objectiveModel: ObjectiveModel?
    private var objectiveView: ObjectiveView?
    private var tapView: (top: UIView, bottom: UIView, left: UIView, right: UIView) = (UIView(),UIView(),UIView(),UIView())
    internal var game: Game?
    let landscapeRightConfig = LandscapeRight()
    let portaitConfig = Portrait()
    let landscapeLeftConfig = LandscapeLeft()
    let portaitUpsideDownConfig = PortraitDown()
    var didntChangeTooQuickly = true
    
    var config: ViewConfig? {
        didSet {
             guard let config = config else { return }
            buttonView.frame = config.buttonViewFrame
            objectiveView?.frame = config.objectiveFrame
            buttonView.config = config
            objectiveView?.config = config
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        guard let buckLevel = game?.level,
            let objectives = ObjectiveModel.objectivesByLevel[buckLevel] else { return }
        var patterns: [SingleObjective] = []
        for objective in objectives {
            guard let bools = ObjectiveModel.patternData[objective.pattern] else { return }
            patterns.append(SingleObjective(square: bools))
        }
        objectiveView = ObjectiveView(objectiveViews: patterns)
        guard let objectiveView = objectiveView else { return }
        view.backgroundColor = Color.black
        gameView.frame = view.bounds
        config = portaitConfig
        buttonView.config = portaitConfig
        objectiveView.config = portaitConfig
        view.addSubview(gameView)
        addTapViews()
        view.addSubview(buttonView)
        view.addSubview(objectiveView)
        buttonView.backgroundColor = .clear
   
        scene.size = view.bounds.size
        scene.scaleMode = .aspectFill
        scene.backgroundColor = .black
        scene.game = game
        scene.gameDelegate = self
        scene.objectiveModel = objectiveModel
        gameView.presentScene(scene)
        toggleButtonsAndObjectives()
        buttonView.exit.addTarget(self, action: #selector(dismissGame), for: .touchUpInside)
        updatePatternViews()
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(NSNotification.Name.UIDeviceOrientationDidChange)
    }
    
    @objc private func orientationDidChange() {
        if didntChangeTooQuickly && viewsOn {
            toggleButtonsAndObjectives()
        }
        else if viewsOn {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) { [weak self] in
                guard let weakself = self else { return }
                if weakself.viewsOn {
                weakself.toggleButtonsAndObjectives()
                }
            }
        }
    }
    
    @objc private func dismissGame() {
        dismiss(animated: true)
    }
    
    private func addTapViews() {
        guard let objectiveView = objectiveView else { return }
        
        tapView.top.frame = CGRect(x: 0, y: 0, width: 375, height: 98)
        tapView.bottom.frame = CGRect(x: 0, y: 569, width: 375, height: 98)
        tapView.left.frame = CGRect(x: 0, y: 98, width: 73, height: 471)
        tapView.right.frame = CGRect(x: 302, y: 98, width: 73, height: 471)
        for tapView in [tapView.top, tapView.bottom, tapView.left, tapView.right, buttonView, objectiveView] {
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapOutsideGame(_:)))
            tap.delegate = self
            view.addSubview(tapView)
            tapView.addGestureRecognizer(tap)
            tapView.isUserInteractionEnabled = true
        }
        
    }
    
    internal func tapOnGame() {
        if viewsOn {
            toggleButtonsAndObjectives()
        }
    }
    
    @objc private func tapOutsideGame(_ tapGesture: UITapGestureRecognizer) {
        toggleButtonsAndObjectives()
    }
    
    var viewsOn = true
    internal func toggleButtonsAndObjectives() {
        guard let objectiveView = objectiveView else { return }
        if viewsOn {
            viewsOn = false
            UIView.animate(withDuration: 0.2) {
                for view in objectiveView.subviews + self.buttonView.subviews {
                    view.alpha = 0.0
                }
            }
        }
        else {
            didntChangeTooQuickly = false
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { [weak self] _ in
                self?.didntChangeTooQuickly = true
            }
            viewsOn = true
            let orientation =  UIDevice.current.orientation
            switch orientation {
            case .faceDown, .faceUp, .unknown, .portrait:
                config = portaitConfig
            case .portraitUpsideDown:
                config = portaitUpsideDownConfig
            case .landscapeRight:
                config = landscapeRightConfig
            case .landscapeLeft:
                config = landscapeLeftConfig
            }
          
            UIView.animate(withDuration: 0.2) {
                for view in objectiveView.subviews + self.buttonView.subviews {
                    view.alpha = 1.0
                }
            }
        }
    }
    
    internal func updatePatternViews() {
        guard let objectiveModel = objectiveModel else {return}
        for i in 0..<objectiveModel.patternArray.count {
            objectiveView?.objectiveCounts[i].text = String(objectiveModel.patternArray[i].objective - objectiveModel.patternArray[i].completed)
        }
        for i in 0..<objectiveModel.patternArray.count {
            if objectiveModel.patternArray[i].objective < objectiveModel.patternArray[i].completed {
                print("error in patterns count")
            }
            if objectiveModel.patternArray[i].objective == objectiveModel.patternArray[i].completed {
                objectiveView?.objectiveCounts[i].text = ""
                objectiveView?.objectiveCompletes[i].isHidden = false
            }
        }
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

