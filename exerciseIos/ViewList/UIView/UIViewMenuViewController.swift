//
//  UIViewMenuViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/15.
//

import UIKit

class UIViewMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let uiViewModel: UiViewCellList = UiViewCellList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uiViewModel.numOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIViewMenuCell", for: indexPath)
        cell.textLabel?.text = uiViewModel.UiViewCell[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "CreateViewSegue", sender: nil)
        case 1:
            performSegue(withIdentifier: "AnimationViewSegue", sender: nil)
        default:
            return
        }
    }
    
    @IBAction func touchCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

class UiViewCellList {
    let UiViewCell: [String] = ["Create View", "Animation"]
    
    var numOfCell: Int {
        return UiViewCell.count
    }
}
