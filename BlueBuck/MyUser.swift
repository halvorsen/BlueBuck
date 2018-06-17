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
        if let paidDictionary = MyFileManager.readJsonFile(named: "userPaid") {
            for (key, value) in paidDictionary {
                if key == "userPaid" {
                    if value == "true" {
                        playerHasPaid = true
                    }
                }
            }
        }
        
        if let scoresDictionary = MyFileManager.readJsonFile(named: "userScores") {
            playerScores = scoresDictionary
        }
    }
    
    var playerScores: [String: String] = [:] 
    
    var playerHasPaid: Bool = false
    
}
