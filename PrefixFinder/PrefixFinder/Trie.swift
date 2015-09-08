//
//  Trie.swift
//  PrefixFinder
//
//  Created by Rachel Schifano on 9/8/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

class Trie {
    
    var root: TrieNode!
    
    init() {
        root = TrieNode()
    }
    
    // Build recursive tree of dictionary content
    func addWord(keyword: String) {
        
        // Base case

    }
    
    
    
    
    
    
    
}

// Extend String class functionality
extension String {
    
    // Compute length of string
    var length: Int {
        return Array(self).count
    }
    
}