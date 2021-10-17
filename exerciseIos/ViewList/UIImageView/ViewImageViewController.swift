//
//  ViewImageViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/17.
//

import UIKit

class ViewImageViewController: UIViewController {

    @IBOutlet weak var FirstImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstImageView.image = UIImage(named: "kimchi")
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
