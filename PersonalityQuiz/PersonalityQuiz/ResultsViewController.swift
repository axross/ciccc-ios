//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Kohei Asai on 9/3/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var resultAnswer: UILabel!
    @IBOutlet weak var resultDescription: UILabel!

    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true

        let animal = getAnimalTypeAnsweredMostFrequently()
        
        resultAnswer.text = "\(animal.rawValue)"
        resultDescription.text = animal.definition
    }
    
    func getAnimalTypeAnsweredMostFrequently() -> AnimalType {
        var frequencyOfAnswers: [AnimalType: Int] = [
            .dog: 0,
            .cat: 0,
            .rabbit: 0,
            .turtle: 0,
        ]
        
        for response in responses.map({ $0.type }) {
            frequencyOfAnswers[response]! += 1
        }
        
        return frequencyOfAnswers.sorted(by: { $0.1 > $1.1 }).first!.key
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
