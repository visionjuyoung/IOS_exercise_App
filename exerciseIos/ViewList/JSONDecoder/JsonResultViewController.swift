//
//  JsonResultViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/29.
//

import UIKit

class JsonResultViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nameLabel.text = DiscUserInfo.shared.name
        self.percentageLabel.text = DiscUserInfo.shared.scorePercentageText
        
        guard let result: Result.Info = DiscUserInfo.shared.hightestScoreResult else {return}
        
        self.titleLabel.text = result.title
        self.descriptionTextView.text = result.typeDescription
        
    }
    
    @IBAction func backToMainButton(_ sender: UIButton) {
        self.navigationController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
