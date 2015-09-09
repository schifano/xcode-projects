//
//  StringExtension.swift
//  PrefixFinder
//
//  Created by Rachel Schifano on 9/8/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import Foundation

// Extend String class functionality
public extension String {
    
    // Compute length of string
    var length: Int {
        return Array(self).count
    }
    
    // Returns characters of a string up to a specified index
    // "up-to" meaning, exclusive
    func substringToIndex(to: Int) -> String {
        return self.substringToIndex(advance(self.startIndex, to))
    }
}