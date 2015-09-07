//
//  ViewController.swift
//  Dynamics
//
//  Created by Rachel Schifano on 9/6/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add square UIView
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.greenColor()
        view.addSubview(square)
    }
}