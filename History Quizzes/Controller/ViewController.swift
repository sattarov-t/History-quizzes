//
//  ViewController.swift
//  History Quizzes
//
//  Created by Тимур on 05.08.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var historyBrain = HistoryBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = historyBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        textLabel.text = historyBrain.showRightAnswer()
        
        choice1.isEnabled = historyBrain.turnOff()
        choice2.isEnabled = historyBrain.turnOff()
        choice3.isEnabled = historyBrain.turnOff()

        
    }
    
    
    @IBAction func netxQuestion(_ sender: UIButton) {
        historyBrain.nextQuestion()
        choice1.isEnabled = historyBrain.turnOn()
        choice2.isEnabled = historyBrain.turnOn()
        choice3.isEnabled = historyBrain.turnOn()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        textLabel.text = historyBrain.getQuestionText()
        let choiceAnswer = historyBrain.getAnswer()
        choice1.setTitle(choiceAnswer[0], for: .normal)
        choice2.setTitle(choiceAnswer[1], for: .normal)
        choice3.setTitle(choiceAnswer[2], for: .normal)
         
        progressBar.progress = historyBrain.getProgress()
        scoreLabel.text = "Очки: \(historyBrain.getScore())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    
        
        
    }
    
}

