//
//  Sign.swift
//  RPS
//
//  Created by Kohei Asai on 2019-08-16.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import Foundation
import GameplayKit

enum Sign {
    case rock
    case paper
    case scissors
    
    var asString: String {
        get {
            return signAndString[self]!
        }
    }
    
    func isStronger(than opponent: Sign) -> Bool {
        return self == .rock && opponent == .scissors
            || self == .paper && opponent == .rock
            || self == .scissors && opponent == .paper
    }
    
    static func random() -> Sign {
        return intAndSign[randomChoice.nextInt()]!
    }
}

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

let signAndString: [Sign: String] = [
    .rock: "👊",
    .paper: "🖖",
    .scissors: "🤞",
]

let intAndSign: [Int: Sign] = [
    0: .rock,
    1: .paper,
    2: .scissors,
]
