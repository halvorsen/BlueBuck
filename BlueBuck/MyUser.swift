//
//  User.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 6/16/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import Foundation

final class MyUser {
    static let shared: MyUser = MyUser()
    private init() {
        if let paidDictionary = MyFileManager.readJsonFile(named: "userBlueBuck") {
            for (key, value) in paidDictionary {
                
                switch key {
                case "playerHasPaid":
                    if value == "true" {
                        playerHasPaid = true
                    }
                case "playerHasFoundBlueBuck":
                    if value == "true" {
                        playerHasFoundBlueBuck = true
                    }
                    
                case "playerHas10ScoreFor6Of15":
                    if value == "true" {
                        playerHas10ScoreFor6Of15 = true
                    }
                    
                case "playerHasUnlockedEasterEgg1":
                    if value == "true" {
                        playerHasUnlockedEasterEgg1 = true
                    }
                default: break
                }
            }
        }
        
        if let scoresDictionary = MyFileManager.readJsonFile(named: "userScores") {
            playerScores = scoresDictionary
        }
    }
    
    internal func writeCurrentUserState() {
        var paid = "false"
        var foundBuck = "false"
        var scored10_6_15 = "false"
        var unlockEgg1 = "false"
        if playerHasPaid {
            paid = "true"
        }
        if playerHasFoundBlueBuck {
            foundBuck = "true"
        }
        if playerHasUnlockedEasterEgg1 {
            unlockEgg1 = "true"
        }
        if playerHas10ScoreFor6Of15 {
            scored10_6_15 = "true"
        }
        
        _ = MyFileManager.writeJsonFile(filename: "userBlueBuck", input: [
            "playerHasPaid": paid,
            "playerHasFoundBlueBuck": foundBuck,
            "playerHas10ScoreFor6Of15": scored10_6_15,
            "playerHasUnlockedEasterEgg1": unlockEgg1
            ])
    }
    
    var playerScores: [String: String] = [:]
    
    var playerHasPaid: Bool = false
    
    var playerHasFoundBlueBuck: Bool = false
    
    var playerHasUnlockedEasterEgg1: Bool = false
    
    var playerHas10ScoreFor6Of15: Bool = false
    
}
