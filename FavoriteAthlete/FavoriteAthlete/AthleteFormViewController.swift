//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Kohei Asai on 8/28/19.
//

import UIKit

class AthleteFormViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    var athlete: Athlete?
    
    override func viewDidLoad() {
        updateView()
    }
    
    func updateView() {
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = String(athlete.age)
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        }
    }
    
    @IBAction func onSaveButtonTapped(_ sender: UIButton) {
        guard
            let name = nameTextField.text,
            let ageString = ageTextField.text,
            let league = leagueTextField.text,
            let team = teamTextField.text
        else {
            return
        }
        
        guard let age = Int(ageString) else {
            return
        }

        athlete = Athlete(name: name, age: age, league: league, team: team)
    }
}
