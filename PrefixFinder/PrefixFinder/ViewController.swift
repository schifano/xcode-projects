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
        // FIXME: Handle case sensitivity for word searches
        testTrie.addWord("ball")
        testTrie.addWord("balls")
        testTrie.addWord("balla")
        testTrie.addWord("ballr")
        testTrie.addWord("ballard")
        testTrie.addWord("bat")
        testTrie.addWord("bar")
        
        testTrie.addWord("cat")
        testTrie.addWord("car")
        testTrie.addWord("caw")
        testTrie.addWord("cap")
        testTrie.addWord("captain")
        testTrie.addWord("care")
        
        testTrie.addWord("elantra")
        
        let wordList: Array<String>! = testTrie.findWord("car")
        for word in wordList {
            println("\(word) found in trie")
        }
    }
}