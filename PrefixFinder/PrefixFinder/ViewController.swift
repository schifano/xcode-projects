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
        
        // Read text file to populate tree
        var testTrie: Trie = Trie()
        
        var textWords = readTextFile()
        for word in textWords {
            println(word)
            testTrie.addWord(word)
        }
        
        
//        testTrie.addWord(readTextFile())
        
        // FIXME: Handle case sensitivity for word searches
//        testTrie.addWord("BALL")
//        testTrie.addWord("balls")
//        testTrie.addWord("balla")
//        testTrie.addWord("ballr")
//        testTrie.addWord("ballard")
//        testTrie.addWord("bat")
//        testTrie.addWord("bar")
//        
//        testTrie.addWord("cat")
//        testTrie.addWord("car")
//        testTrie.addWord("caw")
//        testTrie.addWord("cap")
//        testTrie.addWord("captain")
//        testTrie.addWord("care")
//        
//        testTrie.addWord("dog")
        
        let prefix = "cat"
        println("prefix: \(prefix)")
        let wordList: Array<String>! = testTrie.findWord(prefix)
        if wordList != nil {
            println("Words found in trie:")
            for word in wordList {
                println(word)
            }
        } else {
            println("Word not found.")
        }
    }
    
    // Read basic text file for populating tree
    func readTextFile() -> [String] {
        // 350,000 words
        let fileName = "dictionary"
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt")
        assert(nil != (path as String?))
        var error: NSError? = nil
        if let mytext = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: &error) {
            println("contentsOfFile was called successfully!")
//            println("mytext: \(mytext)")
            return mytext.componentsSeparatedByString("\n")
        } else {
            println("I should implement error handling. What happened? \(error)")
            assertionFailure("Check the debugger.")
            return []
        }
    }
}