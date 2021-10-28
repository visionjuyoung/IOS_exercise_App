//
//  InfoPageViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/28.
//

import UIKit

class InfoPageViewController: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var userInfo: UserInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "로그인 정보"
        emailLabel.text = userInfo?.email
        passwordLabel.text = userInfo?.password
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
