//
//  AnimationImageViewViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/17.
//

import UIKit

class AnimationImageViewViewController: UIViewController {
    
    @IBOutlet weak var ImageViewList: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImages()
    }
    
    func setImages() {
        var images: [UIImage] = []
        images.append(UIImage(named: "kimchi")!)
        images.append(UIImage(named: "pasta")!)
        images.append(UIImage(named: "bulgogi")!)
        images.append(UIImage(named: "riceWater")!)
        images.append(UIImage(named: "fishAndChips")!)
        images.append(UIImage(named: "pizza")!)
        images.append(UIImage(named: "potatoChips")!)
        ImageViewList.animationImages = images
        ImageViewList.animationDuration = 10.0
    }
    
    @IBAction func startButton(_ sender: Any) {
        ImageViewList.startAnimating()
    }
    
    @IBAction func stopButton(_ sender: Any) {
        ImageViewList.stopAnimating()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
