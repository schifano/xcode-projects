//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Rachel Schifano on 6/22/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioFile: AVAudioFile!
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine = AVAudioEngine()!
    
    // FIXME: Add accessibility
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        // Initialize, used to convert NSURL to AVAudioFile
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    /**
        Plays back audio at a slower rate.
    
        :param: sender The UIButton clicked on - snail image
    */
    @IBAction func playSlowAudio(sender: UIButton) {
        playAudioWithVariableRate(0.5)
    }
    
    /**
        Plays back audio at a faster rate.
    
        :param: sender The UIButton clicked on - rabbit image
    */
    @IBAction func playFastAudio(sender: UIButton) {
        playAudioWithVariableRate(2.0)
    }
    
    /**
        Helper function for playing back audio at variable rates.
    
        :param: rate The playback rate value
    */
    func playAudioWithVariableRate(rate: Float) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0 // play from beginning
        audioPlayer.play()
    }
    
    /**
        Plays back audio at a higher pitch.
    
        :param: sender The UIButton clicked on - chipmunk image
    */
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    /**
        Plays back audio at a lower pitch.
    
        :param: sender The UIButton clicked on - Darth Vader image
    */
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    /**
        Helper function for playing back audio at variable pitches.
    
        :param: pitch The playback pitch value
    */
    func playAudioWithVariablePitch(pitch: Float) {
        var pitchEffect = AVAudioUnitTimePitch()
        pitchEffect.pitch = pitch
        playAudioWithEffect(pitchEffect)
    }
    
    /**
        Plays back audio with echo (delayed) effect.
    
        :param: sender The UIButton clicked on - the right circles button.
    */
    @IBAction func playAudioWithEcho(sender: UIButton) {
        var delayEffect = AVAudioUnitDelay()
        delayEffect.wetDryMix = 50
        delayEffect.delayTime = 0.5
        playAudioWithEffect(delayEffect)
    }
    
    /**
        Plays back audio with reverb effect.
    
        :param: sender The UIButton clicked on - the left circles button.
    */
    @IBAction func playAudioWithReverb(sender: UIButton) {
        var reverbEffect = AVAudioUnitReverb()
        reverbEffect.loadFactoryPreset(.LargeHall2)
        reverbEffect.wetDryMix = 50
        playAudioWithEffect(reverbEffect)
    }
    
    /**
        Plays audio  back with various effect params.
    
        :parm: effect The effect subclassed within AVAudioUnit
    */
    func playAudioWithEffect(effect: AVAudioUnit) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        audioEngine.attachNode(effect)

        audioEngine.connect(audioPlayerNode, to: effect, format: nil)
        audioEngine.connect(effect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        
        // Start and play audio engine
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }

    /**
        Stops audio from playing back.
    
        :param: sender The UIButton clicked on - stop button
    */
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
       }
    */
}