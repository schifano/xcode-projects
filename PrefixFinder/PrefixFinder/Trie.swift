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
            var lowercaseKeyword = keyword.lowercaseString
            var searchKey = lowercaseKeyword.substringToIndex(current.level + 1)

            // Iterate through array of children Nodes
            for child in current.children {
                // For each node's key, or String/word, does it match the prefix search key?
                // If yes, assign to childToUse, as the node to use
                if child.key == searchKey {
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
  
//            println("FFFFFF current, \(current.key)") // TEST
//            println("FFFFFF childToUse, \(childToUse.key)") // TEST
            current = childToUse
        }
        
        // Add final end of word check
        if (keyword.length == current.level) {
            current.isFinal = true
        }
    }
    
    // Find words based on a prefix
    func findWord(keyword: String) -> Array<String>! {

        // Base case
        if keyword.length == 0 {
            return nil
        }
        
        // Get current root tree and assign to root which is nil (initializes?)
        var current: TrieNode = root
        var searchKey: String!
        var wordList: Array<String> = Array<String>() // Array of strings to store matching words
    
        while (keyword.length != current.level) {
            var childToUse: TrieNode!
            var lowercaseKeyword = keyword.lowercaseString
            var searchKey = lowercaseKeyword.substringToIndex(current.level + 1)
            
            // Iterate through any children
            for child in current.children {
                if child.key == searchKey {
                    childToUse = child
                    current = childToUse
                    break
                }
            }
            // Prefix not found
            if childToUse == nil {
                return nil
            }
        }

        // Retrieve keyword and any descendants (current has node descendents)
        // If the current node is marked as a word, then it needs to be added
        if ((current.key == keyword) && (current.isFinal)) {
            wordList.append(current.key)
        }
        wordList += findFinalWords(current)
        
        return wordList
    }

    func findFinalWords(current: TrieNode) -> Array<String> {
        var wordList: Array<String> = Array<String>()
        // Add children that are words
        for child in current.children {
            if (child.isFinal == true) {
                wordList.append(child.key)
            }
            wordList += findFinalWords(child)
        }
        return wordList
    }
}