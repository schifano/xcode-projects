//
//  GameScene.swift
//  Swiftris
//
//  Created by Rachel Schifano on 9/12/14.
//  Copyright (c) 2014 Block. All rights reserved.
//

import SpriteKit

// define a new constant variable
// for every 6/10th of a sec, shape descends by one row
let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {

    var tick:(() -> ())? // closure, takes no params and returns no values
    var tickLengthMillis = TickLengthLevelOne
    var lastTick:NSDate? // tracks last time there was a tick
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        // if lastTick is nil, we are paused
        if lastTick == nil {
            return
        }
        // !. This symbol is required if the object in question is an optional type. Before we can access it, we must de-reference the optional by placing an exclamation mark immediately after its name. We multiply the result by -1000 in order to get a positive millisecond value.
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            lastTick = NSDate.date()
            tick?()
        }
    }
    
    func startTicking() {
        lastTick = NSDate.date()
    }
    func stopTicking() {
        lastTick = nil
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)
        
    }
}
