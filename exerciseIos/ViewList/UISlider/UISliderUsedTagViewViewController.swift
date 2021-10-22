//
//  UISliderUsedTagViewViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/22.
//

import UIKit

class UISliderUsedTagViewViewController: UIViewController {
    
    static var viewTag: Int = 0
    static var redTag: Int = 1
    static var greenTag: Int = 2
    static var blueTag: Int = 3
    static var alphaTag: Int = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        setTag()
    }
    
    func setTag() {
        var colorView: UIView = self.view.viewWithTag(0)!
        var redSlider: UISlider = self.view.viewWithTag(1) as! UISlider
        var greenSlider: UISlider = self.view.viewWithTag(2) as! UISlider
        var blueSlider: UISlider = self.view.viewWithTag(3) as! UISlider
        var alphaSlider: UISlider = self.view.viewWithTag(4) as! UISlider
    }
}
