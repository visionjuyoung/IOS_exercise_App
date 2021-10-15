//
//  AnimationViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/15.
//

import UIKit

class AnimationViewController: UIViewController {

    
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var widthValueLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func initView() {
        testView.center = view.center
        testView.bounds.size.width = 50
        testView.bounds.size.height = 50
        testView.backgroundColor = UIColor.black
        widthValueLabel.text = "width = \(Int(testView.frame.width))"
        heightValueLabel.text = "height = \(Int(testView.frame.height))"
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resizeButton(_ sender: Any) {
        UIView.animate(withDuration: 2.0, animations: {
            self.testView.transform = CGAffineTransform(scaleX: CGFloat(Int.random(in: 10...50)), y: CGFloat(Int.random(in: 10...50)))
        })
    }
    
    @IBAction func transiteButton(_ sender: Any) {
        UIView.animate(withDuration: 2.0, animations: {
            self.testView.transform = CGAffineTransform(rotationAngle: .pi)
        })
    }
    
    @IBAction func fallButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.testView.transform = CGAffineTransform(translationX: 0, y: CGFloat(Int.random(in: -300...0)))
        })
    }
    
}
