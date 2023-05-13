//
//  ViewController.swift
//  Piano
//
//  Created by 宋一凡 on 2023/5/5.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBAction func playMusicButtonTapped(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
    }
    
    var musicPlayer : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        musicPlayer = try! AVAudioPlayer(contentsOf: url!)
        musicPlayer.play()
    }


}

