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
    
    /**
        Dismisses the current view controller.
    */
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}