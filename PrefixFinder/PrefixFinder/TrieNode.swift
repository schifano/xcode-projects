//
//  TrieNode.swift
//  PrefixFinder
//
//  Created by Rachel Schifano on 9/8/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

// Generic Tree Data Structure
class TrieNode {
    
    var key: String!
    var children: Array<TrieNode>
    var isFinal: Bool
    var level: Int
    
    init() {
        self.children = Array<TrieNode>()
        self.isFinal = false
        self.level = 0
    }
}