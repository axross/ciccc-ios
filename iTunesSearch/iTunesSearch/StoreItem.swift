//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Kohei Asai on 9/19/19.
//  Copyright © 2019 Caleb Hicks. All rights reserved.
//

import Foundation

struct StoreItem: Codable {
    var name: String
    var artistName: String
    var description: String
    var kind: String
    var artworkURL: URL
    
    private enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artistName = "artistName"
        case description = "longDescription"
        case kind = "kind"
        case artworkURL = "artworkUrl100"
    }
}
