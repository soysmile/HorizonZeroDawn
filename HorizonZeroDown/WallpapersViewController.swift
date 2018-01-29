//
//  WallpapersViewController.swift
//  HorizonZeroDown
//
//  Created by George Heints on 25.01.2018.
//  Copyright © 2018 George Heints. All rights reserved.
//

import UIKit

class WallpapersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let attrs = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont(name: "Chalkduster", size: 24)!
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = attrs
        navigationItem.title = "Wallpapers"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    

}
