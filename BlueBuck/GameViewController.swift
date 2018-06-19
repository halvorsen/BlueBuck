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
import SwiftySound


class GameViewController: UIViewController, GameSceneDelegate, UIGestureRecognizerDelegate {
    
    internal var scene = GameScene()
    internal var gameView: GameView?
    private var buttonView = ButtonView()
    private var iconView = UIImageView(image: #imageLiteral(resourceName: "buckIcon"))
    internal var objectiveModel: ObjectiveModel?
    private var objectiveView: ObjectiveView?
    private var tapView: (top: UIView, bottom: UIView, left: UIView, right: UIView) = (UIView(),UIView(),UIView(),UIView())
    internal var game: Game?
    let landscapeRightConfig = LandscapeRight()
    let portaitConfig = Portrait()
    let landscapeLeftConfig = LandscapeLeft()
    let portaitUpsideDownConfig = PortraitDown()
    var didntChangeTooQuickly = true
    var baseView = UIView()
    private var exitLevelPopup: ExitLevelPopup?
    private var layoutConstraints = [NSLayoutConstraint]()
    internal var didRotateDevice: (UIDeviceOrientation) -> Void = {_ in}
    internal var isNotTutorial = true
    
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
        baseView.frame = view.bounds
        baseView.backgroundColor = .clear
        view.addSubview(baseView)
        objectiveView = ObjectiveView(objectiveViews: patterns)
        guard let objectiveView = objectiveView else { return }
        view.backgroundColor = Color.black
        gameView = GameView()
        gameView?.frame.size = CGSize(width: 375, height: 667)
        gameView?.center = view.center
        config = portaitConfig
        buttonView.config = portaitConfig
        objectiveView.config = portaitConfig
        iconView.alpha = 0.92
        iconView.frame.size = CGSize(width: 16, height: 17)
        iconView.center = CGPoint(x: 349, y: 642.5)
        baseView.addSubview(gameView!)
        addTapViews()
        
        baseView.addSubview(iconView)
        baseView.addSubview(buttonView)
        baseView.addSubview(objectiveView)
        buttonView.backgroundColor = .clear
   
        scene.size = gameView!.bounds.size
        scene.scaleMode = .aspectFill
        scene.backgroundColor = .black
        scene.game = game
        scene.gameDelegate = self
        scene.objectiveModel = objectiveModel
        gameView!.presentScene(scene)
        toggleButtonsAndObjectives()
        buttonView.exit.addTarget(self, action: #selector(dismissGame), for: .touchUpInside)
        buttonView.refresh.addTarget(self, action: #selector(refreshGame), for: .touchUpInside)
        updatePatternViews()
        rotateIcon()
        exitLevelPopup = ExitLevelPopup()
        guard let exitLevelPopup = exitLevelPopup else { return }
        exitLevelPopup.alpha = 0.0
        view.addSubview(exitLevelPopup)
        setupConstraints()
        enableConstraints()
        exitLevelPopup.gameCenter.addTarget(self, action: #selector(gameCenterTouchUpInside(_:)), for: .touchUpInside)
        exitLevelPopup.okay.addTarget(self, action: #selector(okayTouchUpInside(_:)), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        switch UIDevice.current.orientation {
        case .portrait:
            orientation = .portrait
        case .portraitUpsideDown:
            orientation = .portraitUpsideDown
        case .landscapeLeft:
            orientation = .landscapeLeft
        case .landscapeRight:
            orientation = .landscapeRight
        default:
            orientation = .portrait
        }
        rotateIcon()
        
    }
    
    @objc private func gameCenterTouchUpInside(_ sender: UIButton) {
        Effects.buttonSoundEffect?.play()

        //display game center controller
    }
    
    @objc private func okayTouchUpInside(_ sender: UIButton) {
        Effects.buttonSoundEffect?.play()

        dismiss(animated: true)
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
        
        switch UIDevice.current.orientation {
        case .portrait:
           orientation = .portrait
        case .portraitUpsideDown:
            orientation = .portraitUpsideDown
        case .landscapeLeft:
            orientation = .landscapeLeft
        case .landscapeRight:
            orientation = .landscapeRight
        default:
            break
        }
        rotateIcon()
        if exitLevelPopup?.alpha == 1.0 {
            displayPopup()
        }
        
        didRotateDevice(orientation)
    }
    
    @objc private func dismissGame() {
        Effects.buttonSoundEffect?.play()

        dismiss(animated: true)
    }
    
    @objc private func refreshGame() {
        guard scene.unlocked else { return }
        DispatchQueue.main.async { [weak self] in
    
        self?.scene.removeAllActions()
        Effects.buttonSoundEffect?.play()
        self?.scene.refreshGame()
        self?.updatePatternViews()
        }
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
            baseView.addSubview(tapView)
            tapView.addGestureRecognizer(tap)
            tapView.isUserInteractionEnabled = true
        }
        
    }
    var movesCounter = 0
    internal func incrementMoveCounter() {
        movesCounter += 1
        buttonView.moves.text = String(movesCounter)
        buttonView.moves.sizeToFit()
    }
    
    internal func resetMoveCounter() {
        movesCounter = 0
        buttonView.moves.text = String(movesCounter)
        buttonView.moves.sizeToFit()
    }
    
    internal func tapOnGame() {
        if viewsOn {
            toggleButtonsAndObjectives()
        }
    }
    
    @objc private func tapOutsideGame(_ tapGesture: UITapGestureRecognizer) {
        
        guard isNotTutorial else { return }
        toggleButtonsAndObjectives()
    }
    
    var orientation = UIDevice.current.orientation {
        didSet {
            scene.orientation = orientation
        }
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
    
            switch orientation {
            case .portrait:
                config = portaitConfig
            case .portraitUpsideDown:
                config = portaitUpsideDownConfig
            case .landscapeRight:
                config = landscapeRightConfig
            case .landscapeLeft:
                config = landscapeLeftConfig
            default:
                return
            }
          
            UIView.animate(withDuration: 0.2) {
                for view in objectiveView.subviews + self.buttonView.subviews {
                    view.alpha = 1.0
                }
            }
        }
    }
    
    let rotationAngle: [UIDeviceOrientation: CGFloat] = [
        .portrait: 0.0,
        .portraitUpsideDown: CGFloat.pi,
        .landscapeRight: CGFloat.pi * -0.5,
        .landscapeLeft: CGFloat.pi * 0.5
    ]
    
    internal func rotateIcon() {
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let weakself = self,
                let rotationAngle = weakself.rotationAngle[weakself.orientation] else {return}
            
            weakself.iconView.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
            
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
    
    private func displayPopup() {
        guard let rotationAngle = rotationAngle[orientation],
            let exitLevelPopup = exitLevelPopup else {return}
        exitLevelPopup.transform = CGAffineTransform(rotationAngle: rotationAngle)
        exitLevelPopup.title.text = String(movesCounter) + " Moves"
        UIView.animate(withDuration: 0.4) {
            exitLevelPopup.alpha = 1.0
        }
        self.baseView.isUserInteractionEnabled = false
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    private func setupConstraints() {
        guard let exitLevelPopup = exitLevelPopup else { return }
        exitLevelPopup.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints.append(exitLevelPopup.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        layoutConstraints.append(exitLevelPopup.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        layoutConstraints.append(exitLevelPopup.heightAnchor.constraint(equalTo: exitLevelPopup.widthAnchor, multiplier: 0.6))
        layoutConstraints.append(exitLevelPopup.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75))
    }
    private func enableConstraints() {
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    internal func gameComplete() {
        //Display sucess popup first
        displayPopup()
        if let presenter = presentingViewController as? LevelsViewController {
        saveHighScore(movesCounter, level: presenter.currentLevel)
        presenter.setTextLabels()
        }
        
    }
    
    private func saveHighScore(_ score: Int, level: Int) {
        let scoreString = String(score)
        let levelString = String(level)
        if let currentHighScore = MyUser.shared.playerScores[levelString],
            let currentHigh = Int(currentHighScore) {
            if score < currentHigh {
                MyUser.shared.playerScores[levelString] = scoreString
               _ =  MyFileManager.writeJsonFile(filename: "userScores", input: MyUser.shared.playerScores)
                sendScoreToGameCenter(score, level: level)
            }
            
        } else {
            MyUser.shared.playerScores[levelString] = scoreString
          _ =  MyFileManager.writeJsonFile(filename: "userScores", input: MyUser.shared.playerScores)
            sendScoreToGameCenter(score, level: level)
        }
        
    }
    
    private func sendScoreToGameCenter(_ score: Int, level: Int) {
        
    }
    
}

