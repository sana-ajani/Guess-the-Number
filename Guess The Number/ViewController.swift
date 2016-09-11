//
//  ViewController.swift
//  Guess The Number
//
//  Created by Sana Ajani on 9/6/16.
//  Copyright © 2016 Sana Ajani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessLabel: UILabel!
    
    @IBOutlet weak var guessTextField: UITextField!
    
    //Variables
    let lowerBound = 1
    let upperBound = 100
    var numberToGuess : Int!
    var numberGuesses = 0
    
    @IBAction func submitButtonPressed(sender: UIButton) {
        if let guess = guessTextField.text {
            if let guessInt = Int(guess) {
                numberGuesses = numberGuesses + 1
                validateGuess(guessInt)
            }
        }
    }
    
    func validateGuess(guess : Int) {
        if (guess < lowerBound || guess > upperBound) {
            showBoundsAlert()
        } else if (guess > numberToGuess) {
            guessLabel.text = "Guessed too high 😁"
        } else if (guess < numberToGuess) {
            guessLabel.text = "Guessed too low 😁"
        } else { //guess is correct
            showWinAlert()
            numberGuesses = 0
            generateRandomNumber()
        }
    }
    
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100.", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Got it", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showWinAlert() {
        let alert = UIAlertController(title: "You win! 🏆", message: "You guessed correctly. It took \(numberGuesses) tries", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Yay", style: .Default, handler: nil)
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func generateRandomNumber() {
        numberToGuess = Int(arc4random_uniform(100)) + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

