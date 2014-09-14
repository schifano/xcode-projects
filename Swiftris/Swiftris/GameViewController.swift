//
//  GameViewController.swift
//  Swiftris
//
//  Created by Rachel Schifano on 9/12/14.
//  Copyright (c) 2014 Block. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure the view
        let skView = view as SKView
        skView.multipleTouchEnabled = false

        // create and configure the scene
        var scene: GameScene
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        // present the scene
        skView.presentScene(scene)
        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
