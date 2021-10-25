//
//  InitialMenuViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/22.
//

import UIKit

class InitialMenuViewController: UIViewController {
    
    private enum AnimalTag : Int {
        case dog = 101
        case cat = 102
        case rabbit = 103
        case hedgehog = 104
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func animalInfo(for tag: AnimalTag) -> AnimalInfo? {
        let assetName: String
        switch tag{
        case AnimalTag.dog:
            assetName = "Dog"
        case AnimalTag.cat:
            assetName = "Cat"
        case AnimalTag.rabbit:
            assetName = "Rabbit"
        case AnimalTag.hedgehog:
            assetName = "Hedgehog"
        }
        return AnimalInfo.decode(from: assetName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button: UIButton = sender as? UIButton else {return}
        guard let nextViewController: DetailViewController = segue.destination as? DetailViewController else {return}
        guard let tag: AnimalTag = AnimalTag(rawValue: button.tag) else {
            print("error of button tag")
            return
        }
        guard let info: AnimalInfo = self.animalInfo(for: tag) else {return}
        nextViewController.animalInfo = info
    }
    
}
