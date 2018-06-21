//
//  FindBuckController.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/20/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import UIKit
import AudioToolbox

final class FindBuckController {
    
    var controller: GameViewController
    var bucks = [UIImageView]()
    
    init(controller: GameViewController) {
        self.controller = controller
        NotificationCenter.default.addObserver(self, selector: #selector(foundBuck), name: Notification.Name("FoundBuck"), object: nil)
        for _ in 0..<50 {
            let buck = UIImageView(image: #imageLiteral(resourceName: "buckIcon"))
            bucks.append(buck)
            buck.center = controller.view.center
        }
        for _ in 50..<100 {
            let buck = UIImageView(image: #imageLiteral(resourceName: "key"))
            buck.center = controller.view.center
            bucks.append(buck)
        }
    }
    
    @objc internal func foundBuck() {
        MyUser.shared.playerHasFoundBlueBuck = true
        MyUser.shared.writeCurrentUserState()
        buckAnimation()
    }
    
    internal func buckAnimation() {
        for i in 0..<100 {
            Timer.scheduledTimer(withTimeInterval: Double(i)*0.1, repeats: false) { _ in
                self.controller.view.addSubview(self.bucks[i])
               
                let dx = CGFloat(arc4random_uniform(1000)) - 500
                let dy = CGFloat(arc4random_uniform(1000)) - 500
               
                UIView.animate(withDuration: 2.0, animations: {
                    self.bucks[i].center.x += dx
                    self.bucks[i].center.y += dy
                }, completion: { _ in
                    self.bucks[i].removeFromSuperview()
                    if dx > 400 {
                        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                    }
                })
            }
        }
    }
}
