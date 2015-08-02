//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Rachel Schifano on 8/1/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    // Do not use optional, use ! if you are sure it won't be nil
    var userChoice: String!
    var opponentChoice: String!
    
    var youWin: Bool!

    // View hierarchy?
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        opponentChoice = generateOpponentChoice()
        println("Opponent Choice: \(opponentChoice)") // TEST
        
        generateResults()
    }
    
    /**
        Helper function to generate a random choice for the opponent.
    */
    func generateOpponentChoice() -> String {
        
        // FIXME: Make this more elegant?
        var randomNumber = arc4random_uniform(3)
        if randomNumber == 1 {
            return "Rock"
        }
        else if randomNumber == 2 {
            return "Paper"
        }
        else {
            return "Scissors"
        }
    }
    
    /**
        Helper function to create results label.
    */
    func generateResults() {
        
        // Check if you have a tie
        if userChoice == opponentChoice {
            self.resultLabel.text = "It's a tie!"
        }
        
        // Check if the user has won
        // Switch statement cannot check optional (nil) value
        switch (userChoice) {
        case "Rock":
            youWin = opponentChoice == "Scissors"
        case "Paper":
            youWin = opponentChoice == "Rock"
        case "Scissors":
            youWin = opponentChoice == "Paper"
        default:
            "I like kittens, too"
        }
    }
    
    /**
        Helper function to display the results of the game!
    */
    func displayResults() {
    }
    
    /**
        Dismisses the current view controller.
    */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}