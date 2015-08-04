//
//  ViewController.swift
//  TextFieldChallengeApp
//
//  Created by Rachel Schifano on 8/3/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var switchTextField: UITextField!
    @IBOutlet weak var textFieldSwitch: UISwitch!
    
    // Delegate Objects
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegates
        self.zipCodeTextField.delegate = zipCodeTextFieldDelegate
        self.cashTextField.delegate = cashTextFieldDelegate
    }

    // Text field method?
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return self.textFieldSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
    @IBAction func toggleTheTextEditor(sender: AnyObject) {
        
        if !(sender as! UISwitch).on {
            self.switchTextField.resignFirstResponder()
        }
    }
}