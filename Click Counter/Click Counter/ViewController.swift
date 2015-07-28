//
//  ViewController.swift
//  Click Counter
//
//  Created by Rachel Schifano on 7/28/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

// Udacity notes
// TODO: Add an additional label and have it increment with the first
// TODO: Add a decrement button
// TODO: Add an action that toggles the background color of the view with each click

import UIKit

class ViewController: UIViewController {

    var count = 0
    var label:UILabel! // make optional since this is currently nil
    var label2: UILabel!
    
    // Executes once after initial view object is set
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // LABEL
        // Without storyboard, have to position label on the screen with code
        // All views have a frame property
        var label = UILabel()
        label.frame = CGRectMake(150, 150, 60, 60)
        label.text = "0"
        
        self.label = label
        
        // Add a second label
        var label2 = UILabel()
        label2.frame = CGRectMake(100, 150, 60, 60)
        label2.text = "0"
        self.label2 = label2
        
        // Add label view to the view hierarchy so that it appears
        // Add as subview to root view
        self.view.addSubview(label)
        self.view.addSubview(label2)
        
        // BUTTON
        var button = UIButton()
        button.frame = CGRectMake(150, 250, 60, 60)
        button.setTitle("Click", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.view.addSubview(button)
        
        // Add target action
        button.addTarget(self, action: "incrementCount", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func incrementCount() {
        self.count++
        // self reaches out of view controller object, gives outlet to label
        self.label.text = "\(self.count)"
        self.label2.text = "\(self.count)"
    }
}