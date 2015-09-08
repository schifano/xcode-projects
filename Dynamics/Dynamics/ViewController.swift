//
//  ViewController.swift
//  Dynamics
//
//  Created by Rachel Schifano on 9/6/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Gravity properties
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    // Collision properties
    var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add square UIView
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.greenColor()
        view.addSubview(square)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        // Collision (boundary)
        collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
}