//
//  SettingsViewController.swift
//  HorizonZeroDown
//
//  Created by George Heints on 25.01.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import UIKit
import AVFoundation

class SettingsViewController: UIViewController {

    var delegate: controlsAudio?
    
    @IBOutlet weak var soundBtnImg: UIButton!
    @IBAction func soundBtn(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleAttrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont(name: "Chalkduster", size: 24)!
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = titleAttrs
        self.navigationController?.navigationBar.tintColor = UIColor.white


        navigationItem.title = "Settings"
        navigationItem.backBarButtonItem?.tintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }


}
