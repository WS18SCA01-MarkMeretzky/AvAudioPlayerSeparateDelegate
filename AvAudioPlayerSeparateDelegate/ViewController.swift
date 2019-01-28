//
//  ViewController.swift
//  AvAudioPlayerSeparateDelegate
//
//  Created by Mark Meretzky on 1/27/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;
import AVFoundation;   //for AVAudioPlayer

class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer? = nil;
    var audioPlayerDelegate: AVAudioPlayerDelegate? = nil;
    @IBOutlet weak var mySwitch: UISwitch!;

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        guard let url: URL = Bundle.main.url(forResource: "musette", withExtension: "mp3") else {
            return;
        }
        print("url = \(url)");
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url);
        } catch {
            print("could not create AVAudioPlayer: \(error)");
            return;
        }

        /*
        Storing the Delegate into the .audioPlayerDelegate property will keep the
        Delegate alive as long as the View Cotroller stays alive.
        Storing the Delegate into the .delegate property of the AVAudioPlayer
        will not by itself keep the Delegate alive as long as the View Controller
        stays alive.
        */
        
        audioPlayerDelegate = Delegate(switch: mySwitch);
        audioPlayer!.delegate = audioPlayerDelegate;
        audioPlayer!.numberOfLoops = 0;   //No infinite loop.
        print("audioPlayer!.duration = \(audioPlayer!.duration) seconds");
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        audioPlayer?.prepareToPlay();   //question mark is optional chaining
    }

    //Called when the switch is turned on or off.

    @IBAction func valueChanged(_ sender: UISwitch) {
        if sender.isOn {
            audioPlayer?.play();
        } else {
            audioPlayer?.pause();
        }
    }
    
}
