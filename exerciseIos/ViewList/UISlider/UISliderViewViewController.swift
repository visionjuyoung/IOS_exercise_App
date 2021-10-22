//
//  UISliderViewViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/21.
//

import UIKit

class UISliderViewViewController: UIViewController {

    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changedColor()
    }
    
    func changedColor() {
        backgroundColorView.backgroundColor = UIColor(red: CGFloat(redSlider.value)/255, green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: CGFloat(alphaSlider.value)/100)
    }
    
    @IBAction func colorChanged(_ sender: UISlider) {
        changedColor()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
