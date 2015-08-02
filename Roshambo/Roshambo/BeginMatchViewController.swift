//
//  ViewController.swift
//  Roshambo
//
//  Created by Rachel Schifano on 7/31/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class BeginMatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /**
        Used for only the storyboard segue
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showResult" {
            let controller = segue.destinationViewController as! ResultViewController
            
            // pass values
        }
    }
    
    /**
        Makes a RPS selection and programatically bring up the next view controller.
    */
    @IBAction func play() {
        // Get the ResultViewController
        var resultViewController: ResultViewController
        resultViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        
        // Set RPS values
        
        // Present the view controller
        self.presentViewController(resultViewController, animated: true, completion: nil)
    }
    
    @IBAction func play2() {
        self.performSegueWithIdentifier("showResult2", sender: self)
    }
}