//
//  ViewController.swift
//  MYOA
//
//  Created by Rachel Schifano on 8/5/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the right bar button item
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (
            title: "Start Over",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: "startOver")
    }

    func startOver() {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewControllerAnimated(true)
        }
    }
    
    // TEST
    deinit {
        println("MYOAViewController has been deallocated")
    }
}