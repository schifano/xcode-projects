//
//  Array2D.swift
//  Swiftris
//
//  Created by Rachel Schifano on 9/13/14.
//  Copyright (c) 2014 Block. All rights reserved.
//

import Foundation

// create a generic type class called Array2D
class Array2D<T> {
    // explicitly declare variables, we know that the number of cols and rows will never change
    let columns: Int
    let rows: Int

    // initialize swift array to hold references
    var array: Array<T?>
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(count:rows * columns, repeatedValue: nil)
    }
    
    // to get a value at a given location ????
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}