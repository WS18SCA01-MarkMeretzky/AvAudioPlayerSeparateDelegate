//
//  Delegate.swift
//  AvAudioPlayerSeparateDelegate
//
//  Created by Mark Meretzky on 1/27/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//
//  To create this file,
//
//  File -> New -> File...
//  Template: iOS
//  Source: Cocoa Touch Class
//  Class: Delegate
//  Subclass of: NSObject
//

import UIKit;
import AVFoundation;   //for AVAudioPlayerDelegate

class Delegate: NSObject, AVAudioPlayerDelegate {
    let mySwitch: UISwitch;
    
    init(switch mySwitch: UISwitch) {
        self.mySwitch = mySwitch;
    }
    
    //Called when the AVAudioPlayer has finished playing the file.

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        mySwitch.setOn(false, animated: true);
    }

    //Called when the AVAudioPlayer has encountered an error in the file.

    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        if let error: Error = error {
            print("audioPlayerDecodeErrorDidOccur: \(error)");
        } else {
            print("audioPlayerDecodeErrorDidOccur");
        }
    }

}
