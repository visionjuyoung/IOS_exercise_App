//
//  JsonQuestionViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/29.
//

import UIKit

class JsonQuestionViewController: UIViewController {
    
    enum ButtonTag: Int {
        case d = 101
        case i,s,c
    }
    
    var questionIndex: Int!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.questionIndex = self.questionIndex ?? 0
        
        if self.questionIndex < 1 {
            self.backButton.isHidden = true
        }
        
        let question: Question = Question.all[questionIndex]
        
        guard let dButton: UIButton = self.view.viewWithTag(ButtonTag.d.rawValue) as? UIButton else {return}
        dButton.setTitle(question.d, for: UIControl.State.normal)
        guard let iButton: UIButton = self.view.viewWithTag(ButtonTag.i.rawValue) as? UIButton else {return}
        iButton.setTitle(question.i, for: UIControl.State.normal)
        guard let sButton: UIButton = self.view.viewWithTag(ButtonTag.s.rawValue) as? UIButton else {return}
        sButton.setTitle(question.s, for: UIControl.State.normal)
        guard let cButton: UIButton = self.view.viewWithTag(ButtonTag.c.rawValue) as? UIButton else {return}
        cButton.setTitle(question.c, for: UIControl.State.normal)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        guard let tag: ButtonTag = ButtonTag(rawValue: sender.tag) else {
            return
        }
        
        switch tag {
        case .d:
            DiscUserInfo.shared.score.d += 1
        case .i:
            DiscUserInfo.shared.score.i += 1
        case .s:
            DiscUserInfo.shared.score.s += 1
        case .c:
            DiscUserInfo.shared.score.c += 1
        }
        
        let nextIndex: Int = self.questionIndex + 1
        
        if Question.all.count > nextIndex,
           let nextViewController: JsonQuestionViewController = self.storyboard?.instantiateViewController(withIdentifier: "JsonQuestionViewController") as? JsonQuestionViewController{
            nextViewController.questionIndex = nextIndex
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.performSegue(withIdentifier: "showResultSegue", sender: nil)
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
