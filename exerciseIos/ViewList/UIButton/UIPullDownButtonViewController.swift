//
//  UIPullDownButtonViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/11/23.
//

import UIKit

class UIPullDownButtonViewController: UIViewController {
    
    
    @IBOutlet weak var pullDownButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let red = UIAction(title: "red", handler: { _ in
            self.view.backgroundColor = .red
        })
        
        let blue = UIAction(title: "blue", handler: { _ in
            self.view.backgroundColor = .blue
        })
        
        let yellow = UIAction(title: "yellow", handler: { _ in
            self.view.backgroundColor = .yellow
        })

        self.pullDownButton.menu = UIMenu(title: "menu", image: nil, identifier: nil, options: .displayInline, children: [red, blue, yellow])
    }
    
    @IBAction func close(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
    }
}
