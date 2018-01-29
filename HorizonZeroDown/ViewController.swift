//
//  ViewController.swift
//  HorizonZeroDown
//
//  Created by George Heints on 25.01.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    @IBAction func toFightBtn(_ sender: Any) {
        performSegue(withIdentifier: "toFight", sender: self)
    }
    @IBOutlet weak var muteViewBtn: UIButton!
    @IBAction func muteBtn(_ sender: Any) {
        let offImg = UIImage(named: "sound_off.png") as UIImage?
        let onImg = UIImage(named: "sound_on.png") as UIImage?
        
        if(backgroundMusicPlayer.isPlaying){
            muteViewBtn.setBackgroundImage(offImg, for: UIControlState.normal)
            backgroundMusicPlayer.pause()
        }
        else{
            muteViewBtn.setBackgroundImage(onImg, for: UIControlState.normal)
            backgroundMusicPlayer.play()
        }
    }
    @IBAction func exitBtn(_ sender: Any) {
        exit(0)
    }
    @IBAction func wallpapersBtn(_ sender: Any) {
        performSegue(withIdentifier: "toWallpapers", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playBackgroundMusic(filename: "HorizonZeroDawn.mp3")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }

    var backgroundMusicPlayer = AVAudioPlayer()
    func loadList(notification: NSNotification){
        backgroundMusicPlayer.stop()
    }
    func playBackgroundMusic(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    

}

