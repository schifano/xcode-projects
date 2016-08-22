//
//  AccelerometerGraphViewController.swift
//  MotionGraphs
//
//  Created by Rachel Schifano on 8/21/16.
//  Copyright © 2016 schifano. All rights reserved.
//

import UIKit
import CoreMotion

class AccelerometerGraphViewController: UIViewController {

    @IBOutlet weak var graphView: UIView!
    @IBOutlet weak var intervalLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    @IBOutlet weak var updateIntervalSlider: UISlider!
    
    let accelerometerMin: NSTimeInterval = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let motionManager = delegate.sharedManager()
        
        if motionManager.accelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1 // set update interval
            
            let queue = NSOperationQueue.mainQueue()
            motionManager.startAccelerometerUpdatesToQueue(queue) {
                [weak self] (data: CMAccelerometerData?, error: NSError?) in
                if let acceleration = data?.acceleration {
                    
                    APLGraphView().addX(acceleration.x, y: acceleration.y, z: acceleration.z)
                    
                    self!.xLabel.text = String(format: "%.2f", acceleration.x)
                    self!.yLabel.text = String(format: "%.2f", acceleration.y)
                    self!.zLabel.text = String(format: "%.2f", acceleration.z)
                }
                
            }
        }
        
//        if let accelerometerData = motionManager!.accelerometerData {
//            print(accelerometerData.acceleration.x) // TEST
//            dispatch_async(dispatch_get_main_queue()) {
//                self.xLabel.text = String(accelerometerData.acceleration.x)
//                self.yLabel.text = String(accelerometerData.acceleration.y)
//                self.zLabel.text = String(accelerometerData.acceleration.z)
//            }
//        }
//        startUpdatesWithSliderValue(updateIntervalSlider.value)
    }
    
    // Start updates with given slider value
//    func startUpdatesWithSliderValue(sliderValue: Float) {
//        
//        let delta: NSTimeInterval = 0.005
//        var updateInterval: NSTimeInterval = accelerometerMin + delta * Double(sliderValue)
//        
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let mManager = appDelegate.sharedManager()
//
//        if mManager.accelerometerActive == true {
//            updateInterval = mManager.accelerometerUpdateInterval
//            mManager.startAccelerometerUpdates()
//            
//            APLGraphView().addX((mManager.accelerometerData?.acceleration.x)!, y: (mManager.accelerometerData?.acceleration.y)!, z: (mManager.accelerometerData?.acceleration.z)!)
//            
//            print(mManager.accelerometerData?.acceleration.x) // TEST
//            
//            dispatch_async(dispatch_get_main_queue()) {
//                self.xLabel.text = String(mManager.accelerometerData?.acceleration.x)
//                self.yLabel.text = String(mManager.accelerometerData?.acceleration.y)
//                self.zLabel.text = String(mManager.accelerometerData?.acceleration.z)
//                
//                self.intervalLabel.text = String(updateInterval)
//            }
//        }
//    }

    /*
        Get instance of motion manager from the AppDelegate and check if accelerometer updates are currently happening. If they are, stop accelerometer updates.
    */
    func stopUpdates() {
        
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // Get AppDelegate
//        let mManager = appDelegate.sharedManager()
//        
//        if mManager.accelerometerActive == true {
//            mManager.stopAccelerometerUpdates()
//        }
    }
}