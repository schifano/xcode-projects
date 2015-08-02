//
//  ViewController.swift
//  Roshambo
//
//  Created by Rachel Schifano on 7/31/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class BeginMatchViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    /**
        Code: Makes a RPS selection and programatically bring up the 
        next view controller.
    
        Rock button.
    */
    @IBAction func playRock(sender: UIButton) {
        // Get the ResultViewController
        var resultViewController: ResultViewController
        resultViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        // pass the selected choice (RPS)
        // randomize a choice (RPS)
        // compare and pass result: image + label
        
        // Present the view controller
        self.presentViewController(resultViewController, animated: true, completion: nil)
    }
    
    /**
        Code and Segue: Performs segue with the segue associated
        with the button pressed.
    
        Paper button.
    */
    @IBAction func playPaper(sender: UIButton) {
        self.performSegueWithIdentifier("showResult2", sender: self)
    }
    
    /**
        Segue: The prepareForSegue func checks which segue ID
        is being passed and presents the next view controller.
        
        Scissors button.
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showResult" {
            let controller = segue.destinationViewController as! ResultViewController
            
            // pass values
        }
    }
}