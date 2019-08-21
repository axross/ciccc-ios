//
//  ViewController.swift
//  Apple Pie
//
//  Created by Kohei Asai on 8/21/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    let incorecctMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var listOfWords = ["nim", "swift", "rust", "reason", "delphi", "v", "cobol", "kotlin", "bosque", "d"].shuffled()
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newRound()
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            
            currentGame = Game(
                word: newWord,
                incorrectMovesRemaining: incorecctMovesAllowed,
                guessedLetters: []
            )
            
            enableLetterButtons(true)
            
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())

        currentGame.playerGuessed(letter: letter)
        
        updateUI()
        updateGameState()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }
}
