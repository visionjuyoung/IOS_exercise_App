//
//  ProgressViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/23.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressView.progress = 0.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        update()
    }
    
    func update() {
        progressView.progress += 0.01
        self.progressView.setProgress(progressView.progress, animated: true)
    }
}
