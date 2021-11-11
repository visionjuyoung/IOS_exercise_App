//
//  SafariViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/11.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func moveToSafari(_ sender: UIButton) {
        let vc = SFSafariViewController(url: URL(string: "https://github.com/visionjuyoung")!)
        self.show(vc, sender: nil)
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
