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
    
    let scrHeight = UIScreen.main.bounds.size.height
    let scrWidth = UIScreen.main.bounds.size.width
    var height: CGFloat?
    var width: CGFloat?
    var clockwise = false
    var antiClockwise = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.frame.origin.x = 0
        imageView.frame.origin.y = 0
        
        let imageHeight = imageView.frame.size.height
        height = imageHeight
        let imageWidth = imageView.frame.size.width
        width = imageWidth
        
        
        
        let time = scrHeight / 150
        
//        UIView.animate(withDuration: 2, animations: {
//            imageView.frame.origin.x = 0
//        }) { (<#Bool#>) in
//            <#code#>
//        }
        
        
        UIView.animate(withDuration: TimeInterval(time), delay: 0, options: [.autoreverse, .repeat], animations: {
            self.imageView.frame.origin.y = self.scrHeight - imageHeight
        }, completion: nil)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
               swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
               view.addGestureRecognizer(swipeLeft)
    }
    
    
    @objc func swiped(gesture: UISwipeGestureRecognizer) {
        
        let swipeGesture = gesture as UISwipeGestureRecognizer
        switch swipeGesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            self.imageView.frame.origin.x = 0
            self.imageView.frame.origin.y = scrHeight - height!
            rotateAntiClockwise()
        case UISwipeGestureRecognizer.Direction.left:
            self.imageView.frame.origin.x = 0
            self.imageView.frame.origin.y = scrHeight - height!
            rotateCockwise()
        default:
            break
        }
    }
    

    
//    @objc func swiped(){
//        self.imageView.frame.origin.x = 0
//    self.imageView.frame.origin.y = scrHeight - height!
//        rotateAntiClockwise()
//
////
////        UIView.addKeyframe(withRelativeStartTime: <#T##Double#>, relativeDuration: <#T##Double#>, animations: <#T##() -> Void#>)
//}
    
    
    func rotateAntiClockwise(){
        UIView.animate(withDuration: 2, animations: {
            self.imageView.frame.origin.x = self.scrWidth - self.width!
        }) { (parth) in
            UIView.animate(withDuration: 2, animations: {
                self.imageView.frame.origin.y = 0
            }) { (animate) in
                UIView.animate(withDuration: 2, animations: {
                    self.imageView.frame.origin.x = 0
                }) { (animate) in
                    UIView.animate(withDuration: 2, animations: {
                        self.imageView.frame.origin.y = self.scrHeight - self.height!
                        self.antiClockwise = true
                    }) {(animate) in
                        if self.antiClockwise{
                            self.rotateCockwise()
                        }
                        
                    }
                }
            }
        }
    }
    
    func rotateCockwise(){
        UIView.animate(withDuration: 2, animations: {
            self.imageView.frame.origin.y = 0
        }) { (parth) in
            UIView.animate(withDuration: 2, animations: {
                self.imageView.frame.origin.x = self.scrWidth - self.width!
            }) { (animate) in
                UIView.animate(withDuration: 2, animations: {
                    self.imageView.frame.origin.y = self.scrHeight - self.height!
                }) { (animate) in
                    UIView.animate(withDuration: 2, animations: {
                        self.imageView.frame.origin.x = 0
                        self.clockwise = true
                    }) {(animate) in
                    if self.clockwise{
                        self.rotateAntiClockwise()
                    }
                }
            }
        }
    }

    }
}

