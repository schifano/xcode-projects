//
//  ViewController.swift
//  Roshambo
//
//  Created by Rachel Schifano on 7/31/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class BeginMatchViewController: UIViewController {

    // TODO: Refactor? Change BeginMatch to Play(?)
    // TODO: Remove test println
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    // MARK: Code
    /**
        Makes a RPS selection and programatically bring up the
        next view controller.
    
        Rock button.
    */
    @IBAction func playRock(sender: UIButton) {
        // Get the ResultViewController
        var resultViewController: ResultViewController
        resultViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        // Pass values - the user's choice
        resultViewController.userChoice = playChoice(sender)
        
        // Present the view controller
        self.presentViewController(resultViewController, animated: true, completion: nil)
    }
    
    // MARK: Code and Segue
    /**
        Performs segue with the segue associated
        with the button pressed.
    
        Paper button.
    */
    @IBAction func playPaper(sender: UIButton) {
        // TODO: Had sender: self...what was the result of this?
        self.performSegueWithIdentifier("showResult", sender: sender)
    }
    
    // MARK: Segue
    /**
        The prepareForSegue func checks which segue ID
        is being passed and presents the next view controller.
        
        Scissors button.
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showResult" {
            let resultViewController = segue.destinationViewController as! ResultViewController
            
            // Pass values
            resultViewController.userChoice = playChoice(sender as! UIButton)
        }
    }
    
    // TODO: Is there a better way to check which button is passed besides currentTitle?
    /**
        Helper method that determines what the user choice was.
    */
    private func playChoice(sender: UIButton) -> String {
        
        println("PLAYCHOICE") // TEST
        println("currentTitle: \(sender.currentTitle)") // TEST
        if sender.currentTitle == "rockButton" {
            return "Rock"
        }
        else if sender.currentTitle == "paperButton" {
            return "Paper"
        }
        else {
            return "Scissors"
        }
    }
}