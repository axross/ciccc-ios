//
//  ViewController.swift
//  DerrickCastle
//
//  Created by Kohei Asai on 8/22/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//enum PlaceImage {
//    case back
//}

struct CastlePlace {
    let name: String
    let image: UIImage;
    let adjacentPlaces: [CastlePlace]
}

let doorway = CastlePlace(
    name: "Doorway",
    image: UIImage(named: "front_door")!,
    adjacentPlaces: [coatRoom]
)

let coatRoom = CastlePlace(
    name: "Coat room",
    image: UIImage(named: "coat_room")!,
    adjacentPlaces: []
)
