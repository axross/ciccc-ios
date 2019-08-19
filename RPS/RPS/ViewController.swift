//
//  ViewController.swift
//  RPS
//
//  Created by Kohei Asai on 2019-08-16.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var computerChoiceLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playerChoiceLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var gameState: GameState = GameState.start
    
    override func viewDidLoad() {
        super.viewDidLoad()

        refresh()
    }
    
    @IBAction func onRockButtonTapped(_ sender: Any) {
        pon(Sign.rock)
    }
    
    @IBAction func onPaperButtonTapped(_ sender: Any) {
        pon(Sign.paper)
    }
    
    @IBAction func onScissorsButtonTapped(_ sender: Any) {
        pon(Sign.scissors)
    }

    @IBAction func onPlayAgainButtonTapped(_ sender: Any) {
        refresh()
    }
    
    func refresh() {
        view.backgroundColor = .white
        computerChoiceLabel.text = "👾"
        statusLabel.text = "Rock, Paper, Scissors?"
        playerChoiceLabel.isHidden = true
        playAgainButton.isHidden = true
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
    }
    
    func pon(_ playerChoice: Sign) {
        let computerChoice = Sign.random()
        
        computerChoiceLabel.text = computerChoice.asString
        playerChoiceLabel.text = playerChoice.asString
        playerChoiceLabel.isHidden = false
        playAgainButton.isHidden = false
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        
        if playerChoice.isStronger(than: computerChoice) {
            statusLabel.text = "You won!"
            view.backgroundColor = UIColor.init(red: 29/255, green: 209/255, blue: 161/255, alpha: 1)
        } else if computerChoice.isStronger(than: playerChoice) {
            statusLabel.text = "You lost!"
            view.backgroundColor = UIColor.init(red: 84/255, green: 160/255, blue: 255/255, alpha: 1)
        } else {
            statusLabel.text = "Draw!"
            view.backgroundColor = UIColor.init(red: 255/255, green: 159/255, blue: 67/255, alpha: 1)
        }
    }
}

