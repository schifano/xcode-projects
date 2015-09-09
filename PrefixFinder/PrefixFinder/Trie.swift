//
//  Trie.swift
//  PrefixFinder
//
//  Created by Rachel Schifano on 9/8/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

public class Trie {
    
    private var root: TrieNode!
    
    // Initialize the root with an empty Trie node
    init() {
        root = TrieNode()
    }
    
    // Build recursive tree of dictionary content
    func addWord(keyword: String) {
        
        // Base case
        if keyword.length == 0 {
            return;
        }
        
        var current: TrieNode = root
        var searchKey: String!
        
        // While we have not reached the end of the tree...
        while (keyword.length != current.level) {
            var childToUse: TrieNode!
            var searchKey = keyword.substringToIndex(current.level + 1)
            
//            println("searchKey: \(searchKey), current.level: \(current.level + 1)") // TEST
            
            // Iterate through array of children Nodes
            for child in current.children {
                // For each node's key, or String/word, does it match the prefix search key?
                // If yes, assign to childToUse, as the node to use
                if child.key == searchKey {
                    // TODO: output this
                    childToUse = child
                    break
                }
            }
            
            // Create a new Node, if there was no match
            if childToUse == nil {
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }

            println("childToUse.key: \(childToUse.key)") // TEST
//            println("childToUse.level: \(childToUse.level)") // TEST
//            println("childToUse: \(childToUse)") // TEST
//            
            current = childToUse
        }
        
        // Add final end of word check
        if (keyword.length == current.level) {
            println("childToUse (current): \(current.key)") // TEST
            current.isFinal = true
            println("isFinal: \(current.isFinal)") // TEST
//            println("End of word reached") // TEST
            return;
        }
    }
    
    // FIXME: Why are words I added not being found?
    // Find words based on a prefix
    func findWord(keyword: String) -> Array<String>! {
        
//        println("inside findWord") // TEST
//        println("keyword: \(keyword)") // TEST
        // Base case
        if keyword.length == 0 {
            return nil
        }
        
        var current: TrieNode = root
        var searchKey: String!
        var wordList: Array<String>! = Array<String>()
        
        while (keyword.length != current.level) {
            
//            println("inside while") // TEST
            
            var childToUse: TrieNode!
            var searchKey = keyword.substringToIndex(current.level)
            
//            println("current.children: \(current.children.count)") // TEST
            
            // Iterate through any children
            for child in current.children {
//                println("inside for") // TEST
                if child.key == searchKey {
//                    println("inside if") // TEST
                    childToUse = child
                    current = childToUse
                    break
                }
            }
            
            // Prefix not found
            if childToUse == nil {
//                println("childToUse == nil") // TEST
                return nil
            }
        }

//        println("outside while") // TEST
        
        // Retrieve keyword and any descendants
        if ((current.key == keyword) && (current.isFinal)) {
            wordList.append(current.key)
        }
        
        // Add children that are words
        for child in current.children {
            if (child.isFinal == true) {
                wordList.append(child.key)
//                println("child.key: \(child.key)") // TEST
            }
        }
  
        println("END OF FIND") // TEST
        
        return wordList
    }
}