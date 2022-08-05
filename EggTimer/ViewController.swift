//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    var timer = Timer()

    let eggTimes = ["Soft": 3,"Medium": 4, "Hard": 5]
    
    @IBAction func harnessChoice(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 1.0
        secondsPassed = 0
        titleLabel.text = "How do you like your eggs?"
 
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self](Timer) in
            
                if self.secondsPassed < totalTime{
                    
                    self.secondsPassed += 1
                    progressBar.progress = 1.0 - (Float(secondsPassed)/Float(totalTime))
                    
                } else {
                    Timer.invalidate()
                    self.titleLabel.text = "DONE!"
                    playSound(soundName: "alarm_sound")
                }
        }
    
    }
    
    func playSound(soundName: String) {
        
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}
