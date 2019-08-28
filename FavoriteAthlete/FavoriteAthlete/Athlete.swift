//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Kohei Asai on 8/27/19.
//

import Foundation

struct Athlete {
    let name: String
    let age: Int
    let league: String
    let team: String
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)."
    }
}
