//
//  ViewController.swift
//  Guess The Number
//
//  Created by Brian Piejak on 1/29/17.
//  Copyright © 2017 Brian Piejak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberOfGuesses += 1
                validateGuess(guessInt)
            }
        }
    }
    
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
    func validateGuess(_ guess:Int) {
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
        } else if guess < numberToGuess {
            guessLabel.text = "Guess higher ⬆️"
        } else if guess > numberToGuess {
            guessLabel.text = "Guess lower ⬇️"
        } else {
            showWinsAlert()
            numberOfGuesses = 0
            guessLabel.text = "Guess The Number"
            generateRandomNumber()
        }
        guessTextField.text = ""
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!",
                                      message: "You should guess between 1 and 100",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showWinsAlert() {
        let alert = UIAlertController(title: "Nailed it 🎉",
                                      message: "You used \(numberOfGuesses) guesses to win", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play again",
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        generateRandomNumber()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

