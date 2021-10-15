//
//  CreateViewViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/15.
//

import UIKit

class CreateViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addViewButton(_ sender: Any) {
        let randomX: Int = Int.random(in: 0...300)
        let randomY: Int = Int.random(in: 0...1000)
        let rect = CGRect(x: randomX, y:randomY, width: 50, height: 50)
        let myView = UIView(frame: rect)
        switch randomX*randomY {
        case 0...30000:
            myView.backgroundColor = UIColor.blue
        case 30000...60000:
            myView.backgroundColor = UIColor.black
        case 60000...90000:
            myView.backgroundColor = UIColor.brown
        default:
            myView.backgroundColor = UIColor.green
        }
        self.view.addSubview(myView)
    }
}
