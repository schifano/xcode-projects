//
//  TrieTextFieldDelegate.swift
//  PrefixFinder
//
//  Created by Rachel Schifano on 9/8/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

class TrieTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // MARK: UITextFieldDelegate Protocol Methods
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // Retrieve current text and update with the new text
        var newText: NSString = textField.text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        var word: Array<String>! = Trie().findWord(textField.text)
        
        println("textField.text: \(textField.text)") // TEST
        
        
        if  word != nil {
            ViewController().resultLabel.text = word[0]
            println(word[0]) // TEST
            return false
        } else {
            return true
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}