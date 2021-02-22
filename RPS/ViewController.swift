//
//  ViewController.swift
//  RPS
//
//  Created by Admin on 22.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var score: (computer: Int, you: Int) = (0, 0)
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var papperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetButton.isHidden = true
    }
    
    //MARK: - IBAction
    
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        play(.rock)
    }
    
    @IBAction func papperButtonPressed(_ sender: UIButton) {
        play(.paper)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
    //MARK: Functions
    
    func play(_ sign: Sign) {
        let computerSign = sign.randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            papperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            papperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            papperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        resetButton.isHidden = false
        
        let  result = sign.getResult(for: computerSign)
        
        switch result {
        case .win:
            statusLabel.text = "You win)"
            self.view.backgroundColor = UIColor.green
            score.you += 1
        case .start:
            reset()
        case .lose:
            statusLabel.text = "You lose)"
            self.view.backgroundColor = UIColor.red
            score.computer += 1
        case .draw:
            statusLabel.text = "Draw)"
            self.view.backgroundColor = UIColor.blue
        }
        
        scoreLabel.text = "Score \(score.computer) : \(score.you)"
    }
    
    func reset() {
        statusLabel.text = "Rock, Paper, Scissors)"
        self.view.backgroundColor = UIColor.white
        
        rockButton.isHidden = false
        papperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = true
    }
}

