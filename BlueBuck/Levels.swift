//
//  Levels.swift
//  ..blueBuck
//
//  Created by Aaron Halvorsen on 5/13/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

internal final class Levels {
    
    internal static let levelByTag: [Int: BuckLevel] = [
        0: .level1,
        1: .level2,
        2: .level3,
        3: .level4,
        4: .level5,
        5: .level6,
        6: .level7,
        7: .level8,
        8: .level9,
        9: .level10,
        10: .level11,
        11: .level12,
        12: .level13,
        13: .level14,
        14: .level15,
        15: .level16,
        16: .level17,
        17: .level18,
        18: .level19,
        19: .level20,
        20: .level21,
        21: .level22,
        22: .levelEgg
    ]
    
    internal static let blockTypeArray: [BuckLevel: [BlockType]] = [
        
        .level1: [
            .white, .blue, .pink, .yellow, .blue,
            .yellow, .pink, .green, .green, .white,
            .green, .pink, .green, .yellow, .pink,
            .yellow, .green, .pink, .pink, .green,
            .pink, .green, .white, .blue, .white,
            .blue, .green, .pink, .blue, .white,
            .white, .pink, .blue, .yellow, .white,
            .white, .white, .pink, .blue, .white,
            .pink, .yellow, .white, .green, .green,
            .white, .green, .white, .green, .white,
            .white, .yellow, .pink, .yellow, .blue,
            .white, .white, .green, .pink, .yellow,
            .pink, .white, .white, .yellow, .pink,
            .pink, .white, .white, .white, .white,
            .pink, .blue, .green, .yellow, .white,
            .pink, .pink, .pink, .yellow, .yellow,
            .green, .yellow, .yellow, .pink, .white,
            .white, .green, .white, .yellow, .white,
            .white, .pink, .blue, .yellow, .yellow,
            .green, .pink, .yellow, .blue, .white,
        ],
        .level2: [
            .green, .white, .yellow, .pink, .green,
            .blue, .blue, .pink, .yellow, .green,
            .green, .green, .yellow, .green, .yellow,
            .white, .white, .pink, .blue, .white,
            .pink, .green, .blue, .green, .blue,
            .blue, .white, .yellow, .green, .blue,
            .white, .blue, .pink, .green, .white,
            .pink, .green, .white, .green, .blue,
            .blue, .pink, .green, .yellow, .white,
            .green, .green, .pink, .green, .pink,
            .green, .pink, .green, .green, .yellow,
            .green, .yellow, .pink, .green, .blue,
            .green, .yellow, .green, .yellow, .white,
            .pink, .blue, .yellow, .white, .blue,
            .white, .blue, .yellow, .pink, .pink,
            .yellow, .yellow, .white, .green, .white,
            .white, .pink, .green, .yellow, .white,
            .blue, .green, .green, .yellow, .yellow,
            .yellow, .yellow, .pink, .blue, .blue,
            .white, .pink, .green, .white, .blue,
        ],
        .level3: [
            .green, .white, .pink, .white, .pink,
            .green, .pink, .white, .yellow, .yellow,
            .white, .pink, .blue, .blue, .yellow,
            .white, .blue, .yellow, .green, .blue,
            .white, .yellow, .blue, .blue, .yellow,
            .blue, .blue, .blue, .green, .pink,
            .white, .yellow, .white, .blue, .yellow,
            .yellow, .green, .yellow, .white, .yellow,
            .green, .white, .white, .yellow, .blue,
            .pink, .pink, .white, .blue, .green,
            .yellow, .blue, .blue, .green, .green,
            .blue, .yellow, .yellow, .blue, .green,
            .pink, .yellow, .green, .green, .blue,
            .green, .blue, .blue, .yellow, .yellow,
            .pink, .white, .green, .blue, .yellow,
            .yellow, .yellow, .blue, .yellow, .green,
            .white, .green, .pink, .pink, .pink,
            .green, .green, .blue, .white, .green,
            .green, .green, .white, .yellow, .yellow,
            .blue, .green, .yellow, .green, .blue,
        ],
        .level4: [
            .white, .blue, .blue, .blue, .blue,
            .pink, .white, .white, .white, .green,
            .blue, .green, .white, .pink, .yellow,
            .blue, .green, .white, .white, .pink,
            .blue, .white, .white, .blue, .white,
            .yellow, .blue, .white, .pink, .white,
            .yellow, .white, .white, .blue, .green,
            .yellow, .green, .green, .white, .white,
            .blue, .yellow, .yellow, .green, .green,
            .pink, .pink, .pink, .blue, .white,
            .yellow, .white, .green, .blue, .white,
            .white, .white, .yellow, .white, .blue,
            .yellow, .yellow, .pink, .pink, .yellow,
            .pink, .yellow, .yellow, .green, .pink,
            .blue, .green, .pink, .green, .pink,
            .green, .pink, .green, .pink, .yellow,
            .pink, .pink, .pink, .blue, .yellow,
            .blue, .yellow, .blue, .blue, .yellow,
            .yellow, .yellow, .white, .yellow, .yellow,
            .white, .green, .yellow, .green, .white,
        ],
        .level5: [
            .pink, .pink, .yellow, .yellow, .yellow,
            .blue, .pink, .blue, .white, .pink,
            .yellow, .white, .yellow, .blue, .blue,
            .white, .blue, .white, .blue, .pink,
            .pink, .yellow, .white, .white, .yellow,
            .white, .green, .pink, .blue, .green,
            .white, .green, .white, .green, .yellow,
            .green, .yellow, .green, .white, .yellow,
            .white, .pink, .yellow, .blue, .yellow,
            .blue, .green, .green, .yellow, .green,
            .pink, .yellow, .yellow, .yellow, .pink,
            .yellow, .yellow, .white, .yellow, .green,
            .yellow, .pink, .green, .white, .yellow,
            .white, .pink, .yellow, .yellow, .pink,
            .blue, .green, .pink, .yellow, .blue,
            .green, .blue, .blue, .pink, .blue,
            .yellow, .blue, .blue, .yellow, .white,
            .yellow, .pink, .green, .white, .white,
            .pink, .green, .yellow, .yellow, .pink,
            .white, .yellow, .blue, .pink, .green,
        ],
        .level6: [
            .white, .yellow, .yellow, .yellow, .green,
            .blue, .green, .green, .pink, .green,
            .green, .green, .white, .pink, .white,
            .blue, .green, .green, .green, .yellow,
            .yellow, .yellow, .green, .green, .green,
            .green, .blue, .yellow, .pink, .green,
            .pink, .yellow, .pink, .blue, .white,
            .yellow, .white, .pink, .green, .pink,
            .green, .pink, .white, .blue, .blue,
            .yellow, .green, .yellow, .white, .white,
            .yellow, .blue, .blue, .white, .pink,
            .pink, .white, .white, .white, .pink,
            .blue, .blue, .pink, .green, .white,
            .green, .pink, .yellow, .blue, .yellow,
            .blue, .pink, .yellow, .yellow, .green,
            .green, .white, .pink, .pink, .green,
            .blue, .blue, .blue, .blue, .blue,
            .pink, .pink, .white, .yellow, .white,
            .blue, .green, .green, .pink, .yellow,
            .green, .white, .green, .yellow, .white,
        ],
        .level7: [
            .blue, .blue, .yellow, .white, .white,
            .white, .blue, .blue, .white, .white,
            .white, .white, .blue, .white, .blue,
            .yellow, .blue, .yellow, .white, .blue,
            .green, .yellow, .white, .pink, .white,
            .blue, .yellow, .green, .pink, .blue,
            .yellow, .pink, .white, .yellow, .blue,
            .blue, .green, .white, .white, .pink,
            .blue, .green, .yellow, .blue, .green,
            .white, .white, .yellow, .green, .green,
            .green, .blue, .white, .pink, .green,
            .yellow, .blue, .pink, .green, .blue,
            .blue, .white, .yellow, .white, .white,
            .pink, .white, .green, .pink, .white,
            .green, .pink, .white, .blue, .blue,
            .yellow, .pink, .pink, .white, .blue,
            .blue, .blue, .blue, .green, .yellow,
            .blue, .pink, .blue, .green, .green,
            .white, .pink, .pink, .blue, .green,
            .green, .pink, .pink, .pink, .green,
        ],
        .level8: [
            .green, .green, .yellow, .yellow, .yellow,
            .blue, .green, .blue, .white, .blue,
            .green, .yellow, .pink, .white, .green,
            .yellow, .yellow, .green, .green, .white,
            .yellow, .pink, .yellow, .blue, .pink,
            .blue, .pink, .green, .white, .yellow,
            .pink, .pink, .white, .white, .green,
            .blue, .yellow, .yellow, .green, .white,
            .pink, .pink, .yellow, .yellow, .blue,
            .green, .yellow, .green, .yellow, .white,
            .green, .pink, .green, .white, .green,
            .yellow, .yellow, .pink, .green, .pink,
            .white, .green, .yellow, .yellow, .white,
            .yellow, .white, .yellow, .blue, .white,
            .pink, .white, .blue, .green, .green,
            .green, .white, .blue, .white, .pink,
            .pink, .blue, .yellow, .yellow, .blue,
            .pink, .white, .yellow, .blue, .pink,
            .white, .pink, .white, .blue, .yellow,
            .green, .blue, .pink, .yellow, .yellow,
        ],
        .level9: [
            .blue, .blue, .blue, .white, .blue,
            .blue, .white, .blue, .green, .white,
            .yellow, .green, .pink, .pink, .white,
            .white, .white, .green, .green, .blue,
            .yellow, .pink, .white, .white, .white,
            .pink, .blue, .blue, .green, .green,
            .blue, .white, .pink, .white, .white,
            .yellow, .blue, .yellow, .green, .yellow,
            .pink, .pink, .blue, .blue, .blue,
            .yellow, .pink, .yellow, .blue, .white,
            .white, .green, .pink, .yellow, .white,
            .yellow, .green, .blue, .green, .white,
            .green, .white, .white, .white, .blue,
            .yellow, .white, .blue, .white, .yellow,
            .white, .yellow, .blue, .yellow, .blue,
            .pink, .yellow, .green, .green, .yellow,
            .green, .pink, .blue, .green, .pink,
            .white, .pink, .white, .green, .green,
            .blue, .blue, .white, .white, .yellow,
            .yellow, .green, .pink, .yellow, .white,
        ],
        .level10: [
            .yellow, .green, .green, .green, .yellow,
            .blue, .blue, .green, .white, .yellow,
            .pink, .green, .yellow, .blue, .green,
            .green, .yellow, .green, .yellow, .pink,
            .pink, .blue, .pink, .yellow, .white,
            .pink, .blue, .white, .yellow, .yellow,
            .pink, .green, .blue, .yellow, .blue,
            .white, .yellow, .white, .pink, .blue,
            .pink, .green, .yellow, .white, .blue,
            .green, .pink, .yellow, .blue, .blue,
            .white, .white, .blue, .pink, .blue,
            .white, .pink, .blue, .pink, .blue,
            .white, .pink, .green, .pink, .blue,
            .blue, .green, .yellow, .white, .pink,
            .pink, .yellow, .green, .blue, .yellow,
            .white, .pink, .pink, .yellow, .pink,
            .green, .green, .yellow, .pink, .blue,
            .pink, .blue, .green, .pink, .green,
            .pink, .pink, .white, .green, .blue,
            .blue, .blue, .blue, .white, .blue,
        ],
        .level11: [
            .green, .white, .yellow, .pink, .pink,
            .yellow, .yellow, .yellow, .blue, .green,
            .blue, .blue, .white, .pink, .blue,
            .pink, .green, .blue, .yellow, .blue,
            .yellow, .pink, .pink, .blue, .blue,
            .yellow, .white, .pink, .pink, .green,
            .blue, .yellow, .blue, .green, .green,
            .yellow, .yellow, .blue, .pink, .pink,
            .green, .white, .white, .white, .green,
            .yellow, .green, .pink, .white, .pink,
            .yellow, .yellow, .yellow, .blue, .green,
            .green, .white, .green, .pink, .yellow,
            .yellow, .green, .green, .yellow, .white,
            .pink, .white, .white, .white, .yellow,
            .yellow, .white, .blue, .green, .blue,
            .blue, .pink, .yellow, .blue, .blue,
            .pink, .blue, .pink, .pink, .white,
            .pink, .white, .pink, .green, .green,
            .pink, .white, .white, .green, .green,
            .blue, .blue, .yellow, .white, .pink,
        ],
        .level12: [
            .white, .white, .green, .pink, .blue,
            .pink, .green, .white, .green, .pink,
            .blue, .green, .yellow, .blue, .blue,
            .green, .green, .blue, .pink, .blue,
            .blue, .green, .yellow, .pink, .yellow,
            .white, .blue, .pink, .green, .blue,
            .white, .white, .green, .green, .yellow,
            .white, .blue, .white, .yellow, .yellow,
            .blue, .white, .yellow, .white, .white,
            .white, .blue, .white, .blue, .pink,
            .yellow, .white, .pink, .pink, .white,
            .yellow, .blue, .pink, .blue, .white,
            .white, .pink, .pink, .yellow, .yellow,
            .blue, .green, .green, .blue, .yellow,
            .green, .green, .blue, .pink, .yellow,
            .white, .green, .pink, .yellow, .white,
            .white, .blue, .white, .blue, .green,
            .yellow, .green, .green, .white, .yellow,
            .blue, .white, .pink, .blue, .pink,
            .white, .blue, .pink, .green, .white,
        ],
        .level13: [
            .green, .green, .yellow, .yellow, .green,
            .blue, .blue, .pink, .white, .pink,
            .pink, .blue, .blue, .yellow, .blue,
            .pink, .pink, .green, .yellow, .green,
            .yellow, .blue, .blue, .white, .yellow,
            .yellow, .green, .white, .yellow, .white,
            .blue, .green, .green, .white, .blue,
            .white, .green, .white, .blue, .blue,
            .pink, .white, .white, .green, .pink,
            .blue, .pink, .white, .green, .white,
            .yellow, .green, .pink, .blue, .green,
            .pink, .blue, .pink, .pink, .green,
            .green, .green, .white, .pink, .blue,
            .white, .pink, .yellow, .blue, .pink,
            .green, .white, .blue, .green, .yellow,
            .yellow, .white, .green, .white, .green,
            .blue, .pink, .white, .green, .yellow,
            .green, .pink, .blue, .white, .yellow,
            .blue, .green, .pink, .pink, .pink,
            .yellow, .blue, .white, .yellow, .yellow,
        ],
        .level14: [
            .green, .green, .blue, .yellow, .green,
            .yellow, .pink, .blue, .green, .pink,
            .pink, .green, .blue, .blue, .yellow,
            .pink, .pink, .green, .yellow, .blue,
            .green, .white, .blue, .green, .yellow,
            .blue, .pink, .yellow, .yellow, .white,
            .white, .pink, .yellow, .pink, .white,
            .white, .pink, .pink, .yellow, .blue,
            .yellow, .yellow, .blue, .blue, .green,
            .blue, .white, .white, .blue, .pink,
            .white, .green, .blue, .yellow, .yellow,
            .blue, .white, .yellow, .pink, .green,
            .blue, .white, .white, .yellow, .yellow,
            .white, .white, .yellow, .yellow, .green,
            .yellow, .blue, .green, .pink, .white,
            .white, .pink, .pink, .white, .pink,
            .blue, .pink, .blue, .yellow, .white,
            .pink, .blue, .yellow, .green, .white,
            .yellow, .blue, .blue, .yellow, .pink,
            .blue, .green, .green, .pink, .yellow,
        ],
        .level15: [
            .yellow, .pink, .yellow, .pink, .pink,
            .pink, .white, .pink, .pink, .green,
            .blue, .pink, .yellow, .white, .pink,
            .yellow, .pink, .blue, .green, .blue,
            .green, .blue, .blue, .white, .yellow,
            .green, .blue, .white, .pink, .yellow,
            .yellow, .green, .white, .pink, .pink,
            .blue, .yellow, .pink, .white, .green,
            .green, .blue, .pink, .white, .yellow,
            .green, .blue, .yellow, .white, .yellow,
            .pink, .pink, .blue, .yellow, .yellow,
            .green, .green, .pink, .yellow, .green,
            .pink, .pink, .green, .yellow, .green,
            .yellow, .white, .white, .yellow, .yellow,
            .yellow, .white, .green, .pink, .green,
            .white, .green, .green, .blue, .white,
            .blue, .yellow, .blue, .green, .green,
            .pink, .white, .blue, .blue, .blue,
            .pink, .blue, .white, .white, .pink,
            .green, .yellow, .white, .white, .white,
        ],
        .level16: [
            .white, .yellow, .green, .pink, .yellow,
            .pink, .pink, .green, .blue, .green,
            .white, .green, .yellow, .green, .pink,
            .blue, .white, .white, .pink, .green,
            .green, .pink, .green, .blue, .pink,
            .yellow, .blue, .pink, .blue, .yellow,
            .blue, .blue, .pink, .yellow, .white,
            .blue, .green, .pink, .green, .pink,
            .green, .yellow, .blue, .green, .blue,
            .green, .blue, .blue, .pink, .blue,
            .blue, .green, .yellow, .white, .blue,
            .white, .blue, .blue, .blue, .green,
            .yellow, .green, .green, .green, .white,
            .pink, .pink, .yellow, .green, .yellow,
            .pink, .pink, .green, .yellow, .pink,
            .pink, .white, .blue, .blue, .green,
            .white, .green, .white, .blue, .pink,
            .green, .yellow, .yellow, .green, .yellow,
            .pink, .blue, .blue, .white, .white,
            .yellow, .pink, .blue, .blue, .yellow,
        ],
        .level17: [
            .green, .green, .blue, .yellow, .white,
            .blue, .white, .green, .pink, .blue,
            .white, .white, .green, .yellow, .white,
            .pink, .white, .white, .blue, .white,
            .green, .green, .pink, .yellow, .green,
            .yellow, .yellow, .yellow, .white, .blue,
            .blue, .blue, .yellow, .white, .yellow,
            .pink, .blue, .pink, .white, .green,
            .pink, .blue, .white, .yellow, .yellow,
            .blue, .green, .yellow, .pink, .yellow,
            .pink, .pink, .pink, .pink, .white,
            .blue, .pink, .pink, .green, .blue,
            .white, .green, .white, .yellow, .blue,
            .pink, .green, .green, .pink, .blue,
            .blue, .white, .pink, .pink, .green,
            .white, .yellow, .pink, .green, .white,
            .blue, .pink, .white, .blue, .green,
            .white, .yellow, .green, .blue, .white,
            .white, .white, .pink, .white, .pink,
            .pink, .white, .blue, .green, .pink,
        ],
        .level18: [
            .white, .yellow, .pink, .blue, .green,
            .green, .yellow, .yellow, .yellow, .white,
            .blue, .blue, .white, .yellow, .white,
            .blue, .green, .blue, .blue, .blue,
            .green, .yellow, .yellow, .blue, .yellow,
            .yellow, .blue, .green, .yellow, .green,
            .yellow, .yellow, .pink, .green, .blue,
            .yellow, .pink, .green, .blue, .white,
            .white, .yellow, .white, .pink, .green,
            .green, .white, .green, .blue, .yellow,
            .green, .pink, .pink, .yellow, .pink,
            .green, .green, .white, .yellow, .yellow,
            .green, .green, .blue, .yellow, .green,
            .white, .yellow, .pink, .pink, .pink,
            .green, .white, .green, .blue, .pink,
            .blue, .blue, .green, .yellow, .green,
            .white, .white, .blue, .blue, .white,
            .green, .yellow, .blue, .pink, .green,
            .blue, .green, .green, .yellow, .green,
            .blue, .blue, .blue, .pink, .pink,
        ],
        .level19: [
            .green, .blue, .pink, .blue, .pink,
            .yellow, .green, .green, .blue, .white,
            .green, .yellow, .white, .white, .blue,
            .white, .pink, .pink, .yellow, .green,
            .white, .white, .pink, .blue, .blue,
            .blue, .blue, .yellow, .blue, .blue,
            .green, .pink, .pink, .green, .blue,
            .blue, .green, .yellow, .white, .yellow,
            .yellow, .white, .pink, .blue, .blue,
            .blue, .blue, .blue, .yellow, .blue,
            .yellow, .blue, .green, .yellow, .yellow,
            .blue, .yellow, .pink, .white, .yellow,
            .pink, .green, .yellow, .yellow, .yellow,
            .yellow, .green, .pink, .white, .pink,
            .white, .green, .white, .yellow, .white,
            .pink, .pink, .blue, .pink, .white,
            .yellow, .green, .white, .green, .yellow,
            .green, .white, .white, .white, .white,
            .yellow, .yellow, .blue, .yellow, .blue,
            .blue, .blue, .yellow, .blue, .white,
        ],
        .level20: [
            .yellow, .green, .green, .yellow, .white,
            .pink, .pink, .blue, .green, .white,
            .white, .yellow, .pink, .blue, .blue,
            .green, .green, .white, .blue, .white,
            .green, .white, .pink, .green, .white,
            .yellow, .blue, .white, .yellow, .green,
            .white, .pink, .white, .pink, .blue,
            .blue, .yellow, .yellow, .pink, .blue,
            .white, .white, .blue, .white, .blue,
            .white, .green, .white, .white, .yellow,
            .green, .white, .white, .pink, .white,
            .yellow, .white, .green, .white, .green,
            .blue, .pink, .yellow, .pink, .pink,
            .blue, .pink, .white, .green, .yellow,
            .white, .pink, .blue, .blue, .blue,
            .green, .green, .green, .white, .pink,
            .green, .white, .white, .blue, .pink,
            .pink, .green, .green, .green, .green,
            .blue, .green, .yellow, .yellow, .green,
            .yellow, .pink, .white, .pink, .blue,
        ],
        .level21: [
            .blue, .white, .blue, .blue, .blue,
            .pink, .green, .pink, .green, .pink,
            .yellow, .pink, .white, .pink, .green,
            .white, .pink, .blue, .pink, .pink,
            .white, .pink, .yellow, .yellow, .pink,
            .blue, .blue, .green, .white, .blue,
            .white, .pink, .green, .blue, .blue,
            .blue, .green, .green, .green, .green,
            .green, .green, .blue, .pink, .blue,
            .pink, .blue, .green, .yellow, .pink,
            .pink, .white, .pink, .white, .green,
            .green, .blue, .pink, .pink, .blue,
            .white, .yellow, .yellow, .green, .pink,
            .blue, .white, .pink, .white, .blue,
            .blue, .blue, .yellow, .white, .pink,
            .pink, .yellow, .green, .white, .green,
            .white, .pink, .white, .white, .yellow,
            .yellow, .white, .yellow, .white, .green,
            .blue, .white, .green, .white, .blue,
            .yellow, .white, .yellow, .pink, .yellow,
        ],
        .level22: [
            .white, .yellow, .green, .pink, .yellow,
            .pink, .pink, .green, .blue, .green,
            .white, .green, .yellow, .green, .pink,
            .blue, .white, .white, .pink, .green,
            .green, .pink, .green, .blue, .pink,
            .yellow, .blue, .pink, .blue, .yellow,
            .blue, .blue, .pink, .yellow, .white,
            .blue, .green, .pink, .green, .pink,
            .green, .yellow, .blue, .green, .blue,
            .green, .blue, .blue, .pink, .blue,
            .blue, .green, .yellow, .white, .blue,
            .white, .blue, .blue, .blue, .green,
            .yellow, .green, .green, .green, .white,
            .pink, .pink, .yellow, .green, .yellow,
            .pink, .pink, .green, .yellow, .pink,
            .pink, .white, .blue, .blue, .green,
            .white, .green, .white, .blue, .pink,
            .green, .yellow, .yellow, .green, .yellow,
            .pink, .blue, .blue, .white, .white,
            .yellow, .pink, .blue, .blue, .yellow,
        ],
        .levelEgg: [
            .blue, .white, .blue, .blue, .blue,
            .blue, .white, .pink, .white, .blue,
            .blue, .blue, .yellow, .white, .pink,
            .pink, .yellow, .green, .white, .green,
            .yellow, .green, .green, .yellow, .white,
            .pink, .pink, .blue, .green, .white,
            .white, .yellow, .pink, .blue, .blue,
            .green, .green, .white, .blue, .white,
            .green, .green, .blue, .pink, .blue,
            .pink, .blue, .green, .yellow, .pink,
            .pink, .white, .pink, .white, .green,
            .green, .blue, .pink, .pink, .blue,
            .white, .yellow, .yellow, .green, .pink,
            .white, .pink, .white, .white, .yellow,
            .yellow, .white, .yellow, .white, .green,
            .blue, .white, .green, .white, .blue,
            .yellow, .white, .yellow, .pink, .yellow,
        ]
        
        ]
    
}
