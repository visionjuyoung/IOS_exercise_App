//
//  ViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/15.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellViewModel: CellList = CellList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModel.numOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstViewCell", for: indexPath)
        
        cell.textLabel?.text = cellViewModel.cellList[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "UIViewSegue", sender: nil)
        case 1:
            performSegue(withIdentifier: "UIImageViewSegue", sender: nil)
        case 2:
            performSegue(withIdentifier: "UITextFieldViewSegue", sender: nil)
        default:
            return
        }
    }
}

class CellList {
    let cellList: [String] = ["UIView", "UIImageView", "UITextField", "UITextView"]
    
    var numOfCell: Int {
        return cellList.count
    }
}
