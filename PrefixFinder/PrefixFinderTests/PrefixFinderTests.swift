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
        testTrie.addWord("Ball")
        testTrie.addWord("Balls")
        testTrie.addWord("Ballard")
        testTrie.addWord("Bat")
        testTrie.addWord("Bar")
    }
    
    /*
    the findWord algorithm will only return strings identified as words. For example, the prefix "Ba" has 3 children,
    but only 2 are marked as final. Even though the phrase "Bal" is found in the trie, it is not
    identified as a word.
    */
    
    func testFindWithPrefix() {
        
        let wordList: Array<String>! = testTrie.findWord("Ba")
        for word in wordList {
            println("findWord: Ba, \(word) found in trie")
        }
        
    }
    
    
    
    /*
    the findWord algorthim will identify both parents and children identified as words
    */
    
    func testFindWithWord() {
        
        let wordList: Array<String>! = testTrie.findWord("Ball")
        for word in wordList {
            print("findWord: Ball, \(word) found in trie..")
        }
        
    }
    
    
    //testing false search results
    func testFindNoExist() {
        
        let keyword: String = "Barstool"
        let wordList: Array<String>! = testTrie.findWord(keyword)
        
        
        if (wordList == nil) {
            println("keyword \(keyword) not found in trie..")
        }
            
        else {
            for word in wordList {
                println("\(word) found in trie..")
            }
        }
        
        
        
    } //end function
}