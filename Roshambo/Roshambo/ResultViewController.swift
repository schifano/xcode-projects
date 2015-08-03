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
    
    // TODO: Cleanup test println
    // TODO: Write lessons learned and remove note comments
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    // Do not use optional, use ! if you are sure it won't be nil
    var userChoice: String!
    var opponentChoice: String!

    // View hierarchy?
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        opponentChoice = generateOpponentChoice()
        println("##########################") // TEST
        println("User Choice: \(userChoice)") // TEST
        println("Oppt Choice: \(opponentChoice)") // TEST
        
        displayResults()
    }
    
    /**
        Helper function to generate a random choice for the opponent.
    */
    func generateOpponentChoice() -> String {
        
        // FIXME: Make this more elegant
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
        Helper function to display the results of the game!
    */
    func displayResults() {
        
        // Would need to make optional if global and without class init
        var youWin: Bool
        
        // Check if you have a tie
        if userChoice == opponentChoice {
            self.resultImageView.image = UIImage(named: "itsATie.png")
            self.resultLabel.text = "It's a tie!"
            println("It's a tie!")
            return
        }
        
        // Check if the user has won
        // Switch statement cannot check optional (nil) value
        switch (userChoice) {
        case "Rock":
            youWin = opponentChoice == "Scissors"
            self.resultImageView.image = UIImage(named: "RockCrushesScissors.png")
        case "Paper":
            youWin = opponentChoice == "Rock"
            self.resultImageView.image = UIImage(named: "PaperCoversRock.png")
        default: // scissors
            youWin = opponentChoice == "Paper"
            self.resultImageView.image = UIImage(named: "ScissorsCutPaper.png")
        }
        
        // FIXME: Find a better solution for displaying losing images ok
        if youWin == true {
            self.resultLabel.text = "Congrats! You won! \n \(userChoice) beats \(opponentChoice)"
        } else {
            self.resultLabel.text = "You lost. :( \n \(opponentChoice) beats \(userChoice)"
            if opponentChoice == "Rock" {
                self.resultImageView.image = UIImage(named: "RockCrushesScissors.png")
            } else if opponentChoice == "Paper" {
                self.resultImageView.image = UIImage(named: "PaperCoversRock.png")
            } else {
                self.resultImageView.image = UIImage(named: "ScissorsCutPaper.png")
            }
        }
    }
    
    /**
        Dismisses the current view controller.
    */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}