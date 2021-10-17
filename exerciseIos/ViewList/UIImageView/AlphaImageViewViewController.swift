//
//  AlphaImageViewViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/17.
//

import UIKit

class AlphaImageViewViewController: UIViewController {

    @IBOutlet weak var AlphaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AlphaImageView.image = UIImage(named: "kimchi")
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func alphaSwitch(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            AlphaImageView.alpha = 1.0
        case 1:
            AlphaImageView.alpha = 0.3
        default:
            return
        }
    }
}
