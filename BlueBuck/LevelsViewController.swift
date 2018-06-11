//
//  LevelsViewController.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/13/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController, TutorialDelegate {
    
    private var game: Game?
    private lazy var levelsView = LevelsView(frame: view.bounds)
    private var enterLevelPopup: EnterLevelPopup?
    private var layoutConstraints = [NSLayoutConstraint]()
    private var objectiveView: ObjectiveView?
    private var tutorialController = TutorialController()
    private lazy var mask = UIView(frame: view.bounds)
    internal var doTutorial = true
    let popupConfig = Popup()
    
    var config: ViewConfig? {
        didSet {
            guard let config = config else { return }
            objectiveView?.frame = config.objectiveFrame
        }
    }
    
    private func displayPopup() {
       
        guard let buckLevel = game?.level,
            let objectives = ObjectiveModel.objectivesByLevel[buckLevel] else { return }
        var patterns: [SingleObjective] = []
        for objective in objectives {
            guard let bools = ObjectiveModel.patternData[objective.pattern] else { return }
            patterns.append(SingleObjective(square: bools))
        }
        objectiveView = ObjectiveView(objectiveViews: patterns)
        guard let objectiveView = objectiveView else { return }
        objectiveView.config = popupConfig
        
        
        guard let enterLevelPopup = enterLevelPopup else { return }
        objectiveView.frame = enterLevelPopup.centerView.bounds
        enterLevelPopup.centerView.addSubview(objectiveView)
        UIView.animate(withDuration: 0.4) {
            enterLevelPopup.alpha = 1.0
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(levelsView)
        
        for button in levelsView.buttons {
            button.addTarget(self, action: #selector(levelTouchUpInside(_:)), for: .touchUpInside)
        }
        
        enterLevelPopup = EnterLevelPopup()
        guard let enterLevelPopup = enterLevelPopup else { return }
        enterLevelPopup.alpha = 0.0
        view.addSubview(enterLevelPopup)
        setupConstraints()
        enableConstraints()
        
        enterLevelPopup.cancel.addTarget(self, action: #selector(cancelTouchUpInside(_:)), for: .touchUpInside)
        enterLevelPopup.okay.addTarget(self, action: #selector(okayTouchUpInside(_:)), for: .touchUpInside)

        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        if doTutorial {
            mask.backgroundColor = Color.black
            view.addSubview(mask)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if doTutorial {
            levelsView.isUserInteractionEnabled = false
            if let level = Levels.levelByTag[2] {
                loadGame(level)
            }
            let gameViewController = GameViewController()
            gameViewController.game = game
            if let level = game?.level,
                let objectives = ObjectiveModel.objectivesByLevel[level] {
                gameViewController.objectiveModel = ObjectiveModel(objectives: objectives)
                gameViewController.modalPresentationStyle = .custom
                gameViewController.modalTransitionStyle = .crossDissolve
                gameViewController.scene.isNotTutorial = false
                gameViewController.isNotTutorial = false
                present(gameViewController, animated: true) { [weak self] in
                    guard let weakself = self else { return }
                    weakself.tutorialController.setTarget(gameView: gameViewController.gameView, levelView: weakself.view)
                    weakself.tutorialController.setClosures(gameViewController: gameViewController)
                        weakself.mask.removeFromSuperview()
                        gameViewController.orientation = .portrait
                        gameViewController.rotateIcon()
                }
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(NSNotification.Name.UIDeviceOrientationDidChange)
    }
    
    @objc private func orientationDidChange() {
        let orientation =  UIDevice.current.orientation
        var rotation: CGFloat = 0.0
        switch orientation {
        case .portrait:
            break
        case .portraitUpsideDown:
            rotation = CGFloat.pi
        case .landscapeRight:
            rotation = CGFloat.pi * -0.5
        case .landscapeLeft:
            rotation = CGFloat.pi * 0.5
        default:
            return
        }
        for button in levelsView.buttons {
            button.transform = CGAffineTransform(rotationAngle: rotation)
        }
        enterLevelPopup?.transform = CGAffineTransform(rotationAngle: rotation)
    }
    
    private func setupConstraints() {
        guard let enterLevelPopup = enterLevelPopup else { return }
        enterLevelPopup.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints.append(enterLevelPopup.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        layoutConstraints.append(enterLevelPopup.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        layoutConstraints.append(enterLevelPopup.heightAnchor.constraint(equalTo: enterLevelPopup.widthAnchor, multiplier: 0.75))
        layoutConstraints.append(enterLevelPopup.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75))
    }
    
    private func enableConstraints() {
        NSLayoutConstraint.activate(layoutConstraints)
    }

    
    private func removePopup() {
        
        UIView.animate(withDuration: 0.4, animations: {
        self.enterLevelPopup?.alpha = 0.0
        }) { _ in
            self.objectiveView?.removeFromSuperview()
            self.objectiveView = nil
            self.levelsView.isUserInteractionEnabled = true
        }
   
    }
    
    @objc private func cancelTouchUpInside(_ sender: UIButton) {
        removePopup()
    }
    
    @objc private func okayTouchUpInside(_ sender: UIButton) {
        presentGame()
        removePopup()
    }
    
    @objc private func levelTouchUpInside(_ sender: UIButton) {
        levelsView.isUserInteractionEnabled = false
        if let level = Levels.levelByTag[sender.tag] {
        loadGame(level)
        } else {
            print("level was nil")
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        enableConstraints()
    }
    private func presentGame() {
        let viewController = GameViewController()
        viewController.game = game
        if let level = game?.level,
            let objectives = ObjectiveModel.objectivesByLevel[level] {
            viewController.objectiveModel = ObjectiveModel(objectives: objectives)
            viewController.modalPresentationStyle = .custom
            viewController.modalTransitionStyle = .crossDissolve
            present(viewController, animated: true)
        }
    }
    
    internal func loadGame(_ level: BuckLevel) {
        var blocks: [Block] = []
        var blockConfigs: [BlockConfig] = []
        for i in 0..<10 {
            for j in 0..<5 {
                let index = 5*i + j
                if let color = Levels.blockTypeArray[level],
                    color.count > index {
                    let newBlock = Block.init(location: (row: i + 1, column: j + 1), type: color[index])
                    blocks.append(newBlock)
                    blockConfigs.append(BlockConfig(location: (row: i + 1, column: j + 1), blockType: color[index]))
                }
            }
        }
        for i in 50..<100 {
            if let color = Levels.blockTypeArray[level],
                color.count > i {
                let newBlock = Block.init(location: (row: 0, column: 0), type: color[i])
                blocks.append(newBlock)
                blockConfigs.append(BlockConfig(location: (row: 0, column: 0), blockType: color[i]))
            }
        }
        game = Game(blocks: blocks, blockConfigs: blockConfigs, level: level)
        displayPopup()
       
    }
    
    private func createLevelsUtility() { // create and print a random level
        let colorDictionary: [UInt32: BlockType] = [
            0: .white,
            1: .blue,
            2: .green,
            3: .pink,
            4: .yellow
        ]
        for i in 1...21 {
            print("\(i): [")
            for _ in 0..<20 {
                let randomNumber = arc4random_uniform(5)
                let randomNumber1 = arc4random_uniform(5)
                let randomNumber2 = arc4random_uniform(5)
                let randomNumber3 = arc4random_uniform(5)
                let randomNumber4 = arc4random_uniform(5)
                print("\(colorDictionary[randomNumber]!), \(colorDictionary[randomNumber1]!), \(colorDictionary[randomNumber2]!), \(colorDictionary[randomNumber3]!), \(colorDictionary[randomNumber4]!),")
            }
            print("],")
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
