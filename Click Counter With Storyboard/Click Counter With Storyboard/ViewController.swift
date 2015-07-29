//
//  ViewController.swift
//  Click Counter With Storyboard
//
//  Created by Rachel Schifano on 7/29/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func incrementCount() {
        self.count++
        self.label.text = "\(self.count)"
    }
}