//
//  UITextViewAutoSizeViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/18.
//

import UIKit

class UITextViewAutoSizeViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        textView.backgroundColor = .lightGray
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        [
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 50)
        ].forEach{ $0.isActive = true }
        
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        
        textView.delegate = self
    }

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let esitmatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach{ (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = esitmatedSize.height
            }
        }
    }
    
}
