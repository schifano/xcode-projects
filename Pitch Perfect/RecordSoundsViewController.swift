//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rachel Schifano on 5/11/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    // Declare global AVAudioRecorder variable
    var audioRecorder:AVAudioRecorder!
    // Create new object for the RecordedAudio class
    var recordedAudio: RecordedAudio!
    var paused: Bool = false
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    /**
        Records audio and hides the stop button and recording label.
    
        :param: sender The UIButton clicked on - microphone button
    */
    @IBAction func recordAudio(sender: UIButton) {
        recordButton.enabled = false
        stopButton.hidden = false
        pauseButton.hidden = false
        recordingLabel.hidden = false
        recordingLabel.text = "Recording in Progress..."
        
        // Check if a resume needs to occur due to previous pause
        if (paused) {
            audioRecorder.record()
        } else {
            // Prepare for recording audio
            let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
            let recordingName = "my_audio.wav"
            let pathArray = [dirPath, recordingName]
            let filePath = NSURL.fileURLWithPathComponents(pathArray)
            println(filePath)
            
            // Create new recording session
            var session = AVAudioSession.sharedInstance()
            session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
            
            audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
            audioRecorder.delegate = self
            audioRecorder.meteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
        }
    }
    
    /**
        Pauses audio from recording.
    */
    @IBAction func pauseAudio(sender: UIButton) {
        audioRecorder.pause()
        recordingLabel.text = "Tap Record to Resume"
        recordButton.enabled = true
        paused = true
    }
    
    /**
        Checks if a recording has completed successfully or not.
        This function is an AVAudioRecorder delegate.
    
        :param: recorder The audio recorder that has finished recording.
        :param: flag A boolean value for success or failure
    */
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if (flag) {
            // Initialize the recordedAudio object
            recordedAudio = RecordedAudio(filePathUrl: recorder.url, title: recorder.url.lastPathComponent!)
        
            // Inherit from UIViewController, recordedAudio is obj that initiates segue
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else {
            println("Recording not successful")
            recordButton.enabled = true // Record again
            stopButton.hidden = true
        }
    }
    
    /**
        Stops recording audio.
    
        :param: sender The UIButton - stop image
    */
    @IBAction func stopRecordingAudio(sender: UIButton) {
        recordingLabel.hidden = true
        
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // When the view loads, hide the label
    }

    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
        pauseButton.hidden = true
        recordButton.enabled = true
        recordingLabel.hidden = false
        recordingLabel.text = "Tap to Record"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Important if multiple segues for a view controller
        if (segue.identifier == "stopRecording") {
            // Make destinationVC the correct type
            let playSoundsVC: PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.receivedAudio = data
        }
    }
}