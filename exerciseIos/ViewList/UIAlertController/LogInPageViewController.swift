//
//  LogInPageViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/28.
//

import UIKit

class LogInPageViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var userInfo: UserInfo = UserInfo(email: "asd@naver.com", password: "qwe123")
    
    enum State: String {
        case none = "아이디 정보"
        case idWrong = "아이디"
        case passwordWrong = "비밀번호"
        case correct
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func logInButton(_ sender: UIButton) {
        let logInState: State = checkId(id: emailField, password: passwordField)
        
        switch logInState {
        case .none:
            logInAlert(issue: State.none.rawValue)
        case .idWrong:
            logInAlert(issue: State.idWrong.rawValue)
        case .passwordWrong:
            logInAlert(issue: State.passwordWrong.rawValue)
        case .correct:
            performSegue(withIdentifier: "showInfoSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let id : String = emailField.text, let password: String = passwordField.text else {
            return
        }
        
        guard let vc : InfoPageViewController = segue.destination as? InfoPageViewController else {
            return
        }
        
        vc.userInfo = UserInfo(email: id, password: password)
    }
    
    func checkId(id: UITextField, password: UITextField) -> State {
        var state: State = State.none
        
        if(id.text == userInfo.email && password.text == userInfo.password){
            state = State.correct
        } else if(id.text != userInfo.email && password.text == userInfo.password){
            state = State.idWrong
        } else if(id.text == userInfo.email && password.text != userInfo.password){
            state = State.passwordWrong
        } else {
            state = State.none
        }
        return state
    }
    
    func logInAlert(issue: String) {
        let alert = UIAlertController.init(title: "로그인 실패", message: "\(issue)를 확인해주세요", preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
