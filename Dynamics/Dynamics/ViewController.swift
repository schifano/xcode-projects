//
//  ViewController.swift
//  Dynamics
//
//  Created by Rachel Schifano on 9/6/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {

    // Gravity properties
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    // Collision properties
    var collision: UICollisionBehavior!
    var square: UIView!
    var snap: UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add square UIView
        square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.greenColor()
        view.addSubview(square)
        
        // Add barrier
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        // Collision (boundary)
        collision = UICollisionBehavior(items: [square])
        collision.collisionDelegate = self
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)

        let itemBehavior = UIDynamicItemBehavior(items: [square])
        itemBehavior.elasticity = 0.6
        animator.addBehavior(itemBehavior)
        
        // Block to log collision
//        collision.action = {
//            println("\(NSStringFromCGAffineTransform(square.transform)) \(NSStringFromCGPoint(square.center))")
//        }
    }
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
//        println("Boundary contact occurred - \(identifier)")
        
        // Change color of square when it collides
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3) {
            collidingView.backgroundColor = UIColor.grayColor()
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        
        let touch = touches.first as! UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
    }
}