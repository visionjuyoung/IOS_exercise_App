//
//  JsonMainViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/29.
//

import UIKit

class JsonMainViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameField.text = nil
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startTestButton(_ sender: UIButton) {
        guard let name: String = self.nameField.text, name.isEmpty == false else {
            let alert: UIAlertController
            alert = UIAlertController(title: "알림", message: "이름을 입력해주세요", preferredStyle: .alert)
            
            let okAction: UIAlertAction
            okAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        DiscUserInfo.shared.name = self.nameField.text
        self.performSegue(withIdentifier: "showQuestionSegue", sender: nil)
    }
}
