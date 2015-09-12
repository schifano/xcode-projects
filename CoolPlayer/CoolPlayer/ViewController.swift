//
//  ViewController.swift
//  CoolPlayer
//
//  Created by Rachel Schifano on 9/11/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {

    @IBOutlet weak var musicButton: UIButton!
    
    override func viewDidLoad() {
        musicButton.layer.cornerRadius = 100
        musicButton.clipsToBounds = true
    }
    
    @IBAction func buttonTapped(sender: AnyObject) {
        var picker = MPMediaPickerController(mediaTypes: MPMediaType.Music)
        picker.delegate = self
        picker.allowsPickingMultipleItems = true
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func mediaPicker(mediaPicker: MPMediaPickerController!, didPickMediaItems mediaItemCollection: MPMediaItemCollection!) {
        var mediaPickerController = MPMusicPlayerController.systemMusicPlayer()
        mediaPickerController.setQueueWithItemCollection(mediaItemCollection)
        mediaPickerController.play()
        dismissViewControllerAnimated(true, completion: nil)
    }

    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController!) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}