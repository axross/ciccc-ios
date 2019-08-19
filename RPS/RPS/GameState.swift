//
//  GameState.swift
//  RPS
//
//  Created by Kohei Asai on 2019-08-16.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import Foundation

enum GameState {
    case start
    case result(playerChosen: Sign, computerChoisen: Sign)
}
