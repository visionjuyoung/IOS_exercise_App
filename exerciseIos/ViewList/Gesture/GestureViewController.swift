//
//  GestureViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/10.
//

import UIKit

class GestureViewController: UIViewController {
    
    @IBOutlet weak var centerX: NSLayoutConstraint!
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var appleImageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var appleImageView: UIImageView!
    @IBOutlet weak var appleImageWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let left = UISwipeGestureRecognizer(target: self, action: #selector(move))
        left.direction = .left
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(move))
        right.direction = .right
        
        let up = UISwipeGestureRecognizer(target: self, action: #selector(move))
        up.direction = .up
        
        let down = UISwipeGestureRecognizer(target: self, action: #selector(move))
        down.direction = .down
        
        self.view.addGestureRecognizer(left)
        self.view.addGestureRecognizer(right)
        self.view.addGestureRecognizer(up)
        self.view.addGestureRecognizer(down)
    }
    
    @objc func move(sender: UIGestureRecognizer){
        guard let swipe = sender as? UISwipeGestureRecognizer else {
            return
        }
        
        switch swipe.direction {
        case UISwipeGestureRecognizer.Direction.up:
            print("up")
            centerY.constant = centerY.constant - 50
        case UISwipeGestureRecognizer.Direction.down:
            print("down")
            centerY.constant = centerY.constant + 50
        case UISwipeGestureRecognizer.Direction.left:
            print("left")
            centerX.constant = centerX.constant - 50
        case UISwipeGestureRecognizer.Direction.right:
            print("right")
            centerX.constant = centerX.constant + 50
        default:
            return
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func tabGesture(_ sender: UITapGestureRecognizer) {
        centerY.constant = 0
        centerX.constant = 0
        
        appleImageHeight.constant = 120
        appleImageWidth.constant = 120
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .changed {
            let scale = sender.scale
            print(scale)
            appleImageHeight.constant = appleImageHeight.constant * scale
            appleImageWidth.constant = appleImageWidth.constant * scale
            
            UIView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
