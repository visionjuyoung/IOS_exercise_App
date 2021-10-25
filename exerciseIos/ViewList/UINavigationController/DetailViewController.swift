//
//  DetailViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var animalInfo: AnimalInfo!
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var animalTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = animalInfo.name
        animalImage.image = UIImage(named: animalInfo.imageName)
        animalLabel.text = animalInfo.name
        animalTextView.text = animalInfo.animalDescription
        
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
