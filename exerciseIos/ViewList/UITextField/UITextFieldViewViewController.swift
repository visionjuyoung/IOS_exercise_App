//
//  UITextFieldViewViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/18.
//

import UIKit

class UITextFieldViewViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var inputNumTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func inputButton(_ sender: Any) {
        numberLabel.text = inputNumTextField.text
    }
    
    @IBAction func keyboardResignTap(_ sender: UITapGestureRecognizer) {
        inputNumTextField.resignFirstResponder()
    }
}
