//
//  UITextViewViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/18.
//

import UIKit

class UITextViewViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editButton(_ sender: Any) {
        switch textView.isEditable {
        case true:
            textView.isEditable = false
            textView.resignFirstResponder()
        case false:
            textView.isEditable = true
            textView.becomeFirstResponder()
            
        }
    }
    
}
