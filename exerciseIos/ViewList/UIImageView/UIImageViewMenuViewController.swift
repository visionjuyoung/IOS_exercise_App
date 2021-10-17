//
//  UIImageViewViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/17.
//

import UIKit

class UIImageViewMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let uiImageViewModel: UiImageViewCellList = UiImageViewCellList()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiImageViewModel.numOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIImageViewMenuCell", for: indexPath)
        cell.textLabel?.text = uiImageViewModel.UiImageViewCell[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "ViewImageViewSegue", sender: nil)
        case 1:
            performSegue(withIdentifier: "AlphaImageViewSegue", sender: nil)
        case 2:
            performSegue(withIdentifier: "AnimationImageViewSegue", sender: nil)
        default:
            return
        }
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class UiImageViewCellList {
    let UiImageViewCell: [String] = ["View Image", "Alpha", "Animation Image"]
    
    var numOfCell: Int {
        return UiImageViewCell.count
    }
}
