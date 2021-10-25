//
//  FinViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/22.
//

import UIKit

class FinViewController: UIViewController {

    @IBOutlet weak var myInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myInfo.text = """
        만든이 : 김주영
        전화번호 : 010-7533-3529
        이메일 : visionjuyoung@gmail.com
        홈페이지 : https://github.com/visionjuyoung
        """
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
