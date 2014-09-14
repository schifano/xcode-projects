//
//  Block.swift
//  Swiftris
//
//  Created by Rachel Schifano on 9/13/14.
//  Copyright (c) 2014 Block. All rights reserved.
//

import SpriteKit

// #1 define precise number of colors
// unsigned 32bit int, only positive numbers, saves space
let NumberOfColors: UInt32 = 6

// #2 declare enumeration of type Int and implement Printable protocol
enum BlockColor: Int, Printable {
    // start with 0 for blue, and end at 5 for yellow
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // return computed property spriteName
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }

    // adheres to Printable protocol, return computed description
    var description: String {
        return self.spriteName
    }
    // recover the enum that matches the numerical value passed
    static func random() -> BlockColor {
        return BlockColor.fromRaw(Int(arc4random_uniform(NumberOfColors)))!
    }
}

// Block is declared as a class which implements both the Printable and Hashable protocols. Hashable allows Block to be stored in Array2D.
class Block: Hashable, Printable {
    // constant, blocks must remain one color
    let color: BlockColor
    // properties
    var column: Int
    var row: Int
    // represent the visual element of the Block to be used by GameScene when rendering and animating each Block.
    var sprite: SKSpriteNode?
    
    // recovers file name for sprite
    var spriteName: String {
        return color.spriteName
    }
    
    // calculated property return the exclusive-or of our row and column properties to generate a unique integer for each Block.
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    // implement description as we must do in order to comply with the Printable protocol.
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column: Int, row: Int, color: BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

// returns true if and only if both Blocks are in the same location and of the same color. This operator is required in order to support the Hashable protocol.
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.toRaw() == rhs.color.toRaw()
}