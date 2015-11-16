//
//  SecondViewController.swift
//  BandPractice
//
//  Created by Dixen Cheng on 11/16/15.
//  Copyright © 2015 Dixen Cheng. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    var recorder : AVAudioRecorder!
    var player:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let recordSettings = [
            AVFormatIDKey: NSNumber(unsignedInt:kAudioFormatAppleLossless),
            AVEncoderAudioQualityKey : AVAudioQuality.Max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey : 44100.0
        ]
        
        do {
            self.recorder = try AVAudioRecorder(URL: NSURL(string: "file:///lala.m4a")!, settings: recordSettings)
            //recorder.delegate = self
            recorder.meteringEnabled = true
            recorder.prepareToRecord() // creates/overwrites the file at soundFileURL
        } catch let error as NSError {
            recorder = nil
            NSLog(error.localizedDescription)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func DoRecord(sender: UIButton) {
        NSLog("hello words!!!!")
        self.recorder.record()
    }
    
    @IBAction func DoPlayppp(sender: UIButton) {
        NSLog("hello play!!!!")
    }
    

    @IBAction func DoStopppp(sender: UIButton) {
        NSLog("hello stop!!!!")
    }
}

