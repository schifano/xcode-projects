//
//  RollViewController.swift
//  Dice
//
//  Created by Jason Schatz on 11/6/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

class RollViewController: UIViewController {
    /**
    * Randomly generates a Int from 1 to 6
    */
    func randomDiceValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 6
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }

    @IBAction func rollTheDice() {
        // Get the DiceViewController
        var diceViewController: DiceViewController
        diceViewController = self.storyboard?.instantiateViewControllerWithIdentifier("DiceViewController") as! DiceViewController
        
        // Set the two dice values to numbers between 1 and 6
        diceViewController.firstValue = self.randomDiceValue()
        diceViewController.secondValue = self.randomDiceValue()
        
        // Present the view controller
        self.presentViewController(diceViewController, animated: true, completion: nil)
    }
}