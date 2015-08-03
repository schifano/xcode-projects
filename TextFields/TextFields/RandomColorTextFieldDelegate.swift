//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Rachel Schifano on 8/3/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import UIKit
import Foundation

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
     func randomColor() -> UIColor {
        // TODO: return a random color
        
        // Create array of colors
        let colors = [UIColor.redColor(), UIColor.orangeColor(), UIColor.yellowColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.purpleColor(), UIColor.brownColor()]
        
        // Choose a random number
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        
        // Choose random color from array
        return colors[randomIndex]
     }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // Set color of text
        textField.textColor = self.randomColor()
        return true
    }
}