//
//  ViewController.swift
//  PrefixFinder
//
//  Created by Rachel Schifano on 9/8/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    // Declare delegate objects
    let trieTextFieldDelegate = TrieTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchTextField.delegate = trieTextFieldDelegate
        
        // TEST
        Trie().addWord("cat")
        Trie().addWord("category")
        Trie().addWord("cater")
        
        
    }
}