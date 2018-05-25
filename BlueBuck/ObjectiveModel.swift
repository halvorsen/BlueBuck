//
//  ObjectiveModel.swift
//  BlueBuck
//
//  Created by Aaron Halvorsen on 5/24/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

internal enum BuckLevel {
    case level1, level2, level3, level4, level5, level6, level7, level8, level9, level10, level11, level12, level13, level14, level15, level16, level17, level18, level19, level20, level21, levelEgg
}

internal enum Pattern {
    case giraffe1, giraffe2, giraffe3, giraffe4, turtle1, turtle2, turtle3, turtle4, rino1, rino2, rino3, rino4, goose1, goose2, goose3, goose4, armadillo1, armadillo2, elephant, monkey, stag1, stag2, stag3, stag4, goat1, goat2, goat3, goat4, ram1, ram2, falcon, mouse, bat1, bat2, bat3, bat4
}

internal enum PatternPlace {
    case first, second, third
}

internal final class ObjectiveModel {
    
    private(set) internal var patternArray: [(pattern: Pattern, objective: Int, completed: Int)] = []
    
    internal func remainingPatternToFind(at patternPlace: PatternPlace) -> Int? {
        switch patternPlace {
        case .first:
            guard patternArray.count > 0 else { return nil }
            if patternArray[0].objective <= patternArray[0].completed {
                return 0
            } else {
                return patternArray[0].objective - patternArray[0].completed
            }
        case .second:
            guard patternArray.count > 1 else { return nil }
            if patternArray[1].objective <= patternArray[1].completed {
                return 0
            } else {
                return patternArray[1].objective - patternArray[1].completed
            }
        case .third:
            guard patternArray.count > 2 else { return nil }
            if patternArray[2].objective <= patternArray[2].completed {
                return 0
            } else {
                return patternArray[2].objective - patternArray[2].completed
            }
        }
     
    }
    
    internal func foundPattern(at patternPlace: PatternPlace) {
        switch patternPlace {
        case .first:
            guard patternArray.count > 0 else { return }
            patternArray[0].completed += 1
        case .second:
            guard patternArray.count > 1 else { return }
            patternArray[1].completed += 1
        case .third:
            guard patternArray.count > 2 else { return }
            patternArray[2].completed += 1
        }
    }
    
    internal func addObjective(with pattern: Pattern, amount: Int) {
        self.patternArray.append((pattern,amount,0))
    }
    
    internal static let objectivesByLevel: [BuckLevel: [(pattern: Pattern, amount: Int)]] = [
        .level1: [(.falcon, 2)],
        .level2: [(.falcon, 2),(.monkey, 1)],
        .level3: [(.turtle3, 2),(.turtle1, 2)],
        .level4: [(.rino1, 1),(.goose1, 1),(.stag1, 1)],
        .level5: [(.bat1, 2),(.falcon, 3),(.stag1, 1)],
        .level6: [(.bat1, 5)],
        .level7: [],
        .level8: [],
        .level9: [],
        .level10: [],
        .level11: [],
        .level12: [],
        .level13: [],
        .level14: [],
        .level15: [],
        .level16: [],
        .level17: [],
        .level18: [],
        .level19: [],
        .level20: [],
        .level21: [],
        .levelEgg: []
    
    ]
    
    internal static let patternData : [Pattern: [Bool]] = [
        .giraffe1: [false, false, true, false, false, true, false, true, true],
        .giraffe2: [false, true, false, false, true, false, false, true, true],
        .giraffe3: [false, false, false, false, false, true, true, true, true],
        .giraffe4: [false, false, false, true, true, true, false, false, true],
        .turtle1: [false, false, false, false, true, false, true, true, true],
        .turtle2: [false, false, false, true, true, true, false, true, false],
        .turtle3: [false, true, false, false, true, true, false, true, false],
        .turtle4: [false, false, true, false, true, true, false, false, true],
        .rino1: [false, true, false, false, true, false, true, true, true],
        .rino2: [true, true, true, false, true, false, false, true, false],
        .rino3: [false, false, true, true, true, true, false, false, true],
        .rino4: [true, false, false, true, true, true, true, false, false],
        .goose1: [true, true, true, false, false, true, false, false, true],
        .goose2: [true, true, true, true, false, false, true, false, false],
        .goose3: [true, false, false, true, false, false, true, true, true],
        .goose4: [false, false, true, false, false, true, true, true, true],
        .armadillo1: [false, false, false, true, true, true, true, true, true],
        .armadillo2: [false, true, true, false, true, true, false, true, true],
        .elephant: [true, true, true, true, true, true, true, true, true],
        .monkey:[true, true, true, true, false, true, true, true, true],
        .stag1: [true, false, true, true, false, true, true, true, true],
        .stag2: [true, true, true, true, false, false, true, true, true],
        .stag3: [true, true, true, false, false, true, true, true, true],
        .stag4: [true, true, true, true, false, true, true, false, true],
        .goat1: [false, false, false, true, false, true, true, true, true],
        .goat2: [false, false, false, true, true, true, true, false, true],
        .goat3: [false, true, true, false, true, false, false, true, true],
        .goat4: [false, true, true, false, false, true, false, true, true],
        .ram1: [true, true, true, false, true, false, true, true, true],
        .ram2: [true, false, true, true, true, true, true, false, true],
        .falcon: [false, true, false, true, true, true, false, true, false],
        .mouse: [false, false, false, false, true, true, false, true, true],
        .bat1: [false, false, true, false, true, true, true, true, true],
        .bat2: [true, false, false, true, true, false, true, true, true],
        .bat3: [true, true, true, false, true, true, false, false, true],
        .bat4: [true, true, true, true, true, false, true, false, false]
    ]
    
    
}
