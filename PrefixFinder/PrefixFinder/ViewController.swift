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
        
        var testTrie: Trie = Trie()
        // TEST
        testTrie.addWord("Ball")
        testTrie.addWord("Balls")
        testTrie.addWord("Balla")
        testTrie.addWord("Ballr")
        testTrie.addWord("Ballard")
        testTrie.addWord("Bat")
        testTrie.addWord("Bar")
        
        testTrie.addWord("Cat")
        testTrie.addWord("Car")
        testTrie.addWord("Caw")
        testTrie.addWord("Cap")
        
        testTrie.addWord("Elantra")
        
        // Seems to look for entire prefix + 1 letter after...
        let wordList: Array<String>! = testTrie.findWord("Ca")
        for word in wordList {
            println("\(word) found in trie")
        }

        
    }
}