//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldChallengeApp
//
//  Created by Rachel Schifano on 8/3/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // Allow only numerals and max of five characters
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 5
        let currentString: NSString = textField.text
        let newString: NSString = currentString.stringByReplacingCharactersInRange(range, withString: string)
        return newString.length <= maxLength
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
}