//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Kohei Asai on 9/3/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var singleQuestionStack: UIStackView!
    @IBOutlet weak var singleQuestionButton1: UIButton!
    @IBOutlet weak var singleQuestionButton2: UIButton!
    @IBOutlet weak var singleQuestionButton3: UIButton!
    @IBOutlet weak var singleQuestionButton4: UIButton!
    @IBOutlet weak var multipleQuestionStack: UIStackView!
    @IBOutlet weak var multipleQuestionLabel1: UILabel!
    @IBOutlet weak var multipleQuestionLabel2: UILabel!
    @IBOutlet weak var multipleQuestionLabel3: UILabel!
    @IBOutlet weak var multipleQuestionLabel4: UILabel!
    @IBOutlet weak var multipleQuestionSwitch1: UISwitch!
    @IBOutlet weak var multipleQuestionSwitch2: UISwitch!
    @IBOutlet weak var multipleQuestionSwitch3: UISwitch!
    @IBOutlet weak var multipleQuestionSwitch4: UISwitch!
    @IBOutlet weak var rangedQuestionStack: UIStackView!
    @IBOutlet weak var rangedQuestionLabel1: UILabel!
    @IBOutlet weak var rangedQuestionLabel2: UILabel!
    @IBOutlet weak var rangedQuestionSlider: UISlider!

    let questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle),
                ]
        ),
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Swimming", type: .dog),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Eating", type: .turtle),
                ]
        ),
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "I dislike them", type: .cat),
                    Answer(text: "I get a little nervoys", type: .rabbit),
                    Answer(text: "I barely notice them", type: .turtle),
                    Answer(text: "I love them", type: .dog),
                ]
        )
    ]
    
    var currentQuestionIndex = 0
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            
            resultsViewController.responses = answersChosen
        }
    }
    
    func updateView() {
        let currentQuestion = questions[currentQuestionIndex]
        let totalProgress = Float(currentQuestionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(currentQuestionIndex + 1)"
        questionLabel.text = currentQuestion.text
        progress.setProgress(totalProgress, animated: true)

        singleQuestionStack.isHidden = true
        multipleQuestionStack.isHidden = true
        rangedQuestionStack.isHidden = true
        
        switch currentQuestion.type {
        case .single:
            updateSingleQuestionStack(using: currentQuestion.answers)
        case .multiple:
            updateMultipleQuestionStack(using: currentQuestion.answers)
        case .ranged:
            updateRangedQuestionStack(using: currentQuestion.answers)
        }
    }
    
    func proceedQuestion() {
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            updateView()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    func updateSingleQuestionStack(using answers: [Answer]) {
        singleQuestionStack.isHidden = false
        singleQuestionButton1.setTitle(answers[0].text, for: .normal)
        singleQuestionButton2.setTitle(answers[1].text, for: .normal)
        singleQuestionButton3.setTitle(answers[2].text, for: .normal)
        singleQuestionButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleQuestionStack(using answers: [Answer]) {
        multipleQuestionStack.isHidden = false
        multipleQuestionSwitch1.isOn = false
        multipleQuestionSwitch2.isOn = false
        multipleQuestionSwitch3.isOn = false
        multipleQuestionSwitch4.isOn = false
        multipleQuestionLabel1.text = answers[0].text
        multipleQuestionLabel2.text = answers[1].text
        multipleQuestionLabel3.text = answers[2].text
        multipleQuestionLabel4.text = answers[3].text
    }
    
    func updateRangedQuestionStack(using answers: [Answer]) {
        rangedQuestionStack.isHidden = false
        rangedQuestionSlider.setValue(0.5, animated: false)
        rangedQuestionLabel1.text = answers.first?.text
        rangedQuestionLabel2.text = answers.last?.text
    }
    
    @IBAction func onSingleQuestionButtonTapped(_ sender: UIButton) {
        let currentAnswers = questions[currentQuestionIndex].answers
        
        switch sender {
        case singleQuestionButton1:
            answersChosen.append(currentAnswers[0])
        case singleQuestionButton2:
            answersChosen.append(currentAnswers[1])
        case singleQuestionButton3:
            answersChosen.append(currentAnswers[2])
        case singleQuestionButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        proceedQuestion()
    }
    
    @IBAction func onMultipleQuestionSubmitButtonTapped(_ sender: UIButton) {
        let currentAnswers = questions[currentQuestionIndex].answers
        
        if multipleQuestionSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        
        if multipleQuestionSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        
        if multipleQuestionSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        
        if multipleQuestionSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }

        proceedQuestion()
    }
    
    @IBAction func onRangedQuestionSubmitButtonTapped(_ sender: UIButton) {
        let currentAnswers = questions[currentQuestionIndex].answers
        let index = Int(round(rangedQuestionSlider.value * Float(currentAnswers.count - 1)))

        answersChosen.append(currentAnswers[index])

        proceedQuestion()
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
