//
//  ViewController.swift
//  OffTheShelfViewPresentation
//
//  Created by Rachel Schifano on 7/29/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func experiment1() {
        let imagePickerController = UIImagePickerController()
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func experiment2() {
        let image = UIImage()
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.presentViewController(activityController, animated: true, completion: nil)
        
    }
    
    @IBAction func experiment3() {
        let alertController = UIAlertController()
        alertController.title = "Test Alert"
        alertController.message = "This is a test alert"
//        self.presentViewController(alertController, animated: true, completion: nil)
        
        // Create closure to add OK button for user
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) {
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}