//
//  PrefixFinderTests.swift
//  PrefixFinderTests
//
//  Created by Rachel Schifano on 9/8/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import XCTest
import PrefixFinder // Import the folder containing classes you may want to test

class PrefixFinderTests: XCTestCase {
    
    // Create new test Trie
    var testTrie: Trie = Trie()
    
    override func setUp() {
        super.setUp()
        
        // I assume the message means error message
        XCTAssertNotNil(testTrie, "Trie not properly initialized")
        
        // Add words to data structure
        testTrie.addWord("ball")
        testTrie.addWord("balls")
        testTrie.addWord("ballerina")
        testTrie.addWord("bat")
        testTrie.addWord("bar")
    }
    
    /*
        Returns all strings marked as words that contain the given prefix.
    */
    func testFindWithPrefix() {
        
        let wordList: Array<String>! = testTrie.findWord("ba")
        for word in wordList {
            println("findWord: Ba, \(word) found in trie")
        }
    }
    
    /*
        Returns the exact word match if it exists.
    */
    
    func testFindWithWord() {
        
        let wordList: Array<String>! = testTrie.findWord("bat")
        for word in wordList {
            print("findWord: bat, \(word) found in trie")
        }
    }
    
    /*
        Search a word that does not exist within the tree.
    */
    func testFindNoExist() {
        
        let keyword: String = "Barstool"
        let wordList: Array<String>! = testTrie.findWord(keyword)
        
        if wordList != nil {
            for word in wordList {
                println("\(word) found in trie")
            }
        } else {
            println("Word not found.")
        }
    }

    // FIXME: Just because it returns true does not mean it's the behavior we expect.
    /*
        Search for a word that exists in the key given the word with varying case (upper/lower).
    */
    func testFindWordWithDifferentCase() {
        
        let keyword: String = "Ball"
        let wordList: Array<String>! = testTrie.findWord(keyword)
        
        if wordList != nil {
            for word in wordList {
                println("\(word) found in trie")
            }
        } else {
            println("Word not found.")
        }
    }
}