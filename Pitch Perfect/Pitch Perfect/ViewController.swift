//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Rachel Schifano on 5/11/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBAction func recordAudio(sender: UIButton) {
        // TODO: Show text "recording in progress"
        // TODO: Record the user's voice

        recordingLabel.hidden = false

        println("in recordAudio") // TEST
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        recordingLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

