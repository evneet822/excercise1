//
//  ViewController.swift
//  ex 1
//
//  Created by MacStudent on 2020-01-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.frame.origin.x = 0
        imageView.frame.origin.y = 0
        
        let h = imageView.frame.size.height
        let scrHeight = UIScreen.main.bounds.size.height
        
        let time = scrHeight / 150
        
        UIView.animate(withDuration: TimeInterval(time)) {
            self.imageView.frame.origin.y = scrHeight - h
        }
        
        
    }


}

