//
//  ViewController.swift
//  LaunchImagePicker
//
//  Created by Rachel Schifano on 7/29/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func experiment() {
        let nextController = UIImagePickerController()
        
        self.presentViewController(nextController, animated: true, completion: nil)
    }

}

