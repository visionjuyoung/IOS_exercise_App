//
//  customButton.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/17.
//

import UIKit

class customButton: UIButton {

    let indicator = UIActivityIndicatorView()
    
    func makeIndicator() {
        DispatchQueue.main.async {
            self.indicator.isHidden = true
        }
        self.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .gray
        indicator.startAnimating()
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        indicator.isUserInteractionEnabled = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeIndicator()
    }
    
    func startLoading() {
        self.setTitle("", for: UIControl.State.normal)
        indicator.isHidden = false
    }
    
    func stopLoading() {
        self.setTitle("배경 색 바꾸기", for: UIControl.State.normal)
        indicator.isHidden = true
    }
    
    func end() {
        self.setTitle("원래 색으로", for: UIControl.State.normal)
        indicator.isHidden = true
    }
}
