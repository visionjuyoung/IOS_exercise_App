//
//  UIButtonViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/17.
//

import UIKit

class UIButtonViewController: UIViewController {
    
    @IBOutlet var mainview: UIView!
    var loading = false
    
    @IBOutlet weak var loadingButton: customButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingButton.layer.borderWidth = 1
        loadingButton.layer.borderColor = UIColor.gray.cgColor
        loadingButton.titleLabel?.text = "배경 색 바꾸기"
    }
    
    @IBAction func pressButton(_ sender: Any) {
        loading.toggle()
        if loading == true {
            loadingButton.startLoading()
            UIView.animate(withDuration: 6.0 , animations: {
                self.mainview.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1)
            }, completion: {_ in
                self.loadingButton.end()
            })
        } else {
            loadingButton.startLoading()
            UIView.animate(withDuration: 6.0, animations: {
                self.mainview.backgroundColor = .white
            }, completion: {_ in
                self.loadingButton.stopLoading()
            })
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
