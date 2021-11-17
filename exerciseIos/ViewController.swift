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
        case 3:
            performSegue(withIdentifier: "UITextViewSegue", sender: nil)
        case 4:
            performSegue(withIdentifier: "UISliderViewSegue", sender: nil)
        case 5:
            performSegue(withIdentifier: "UINavigationControllerSegue", sender: nil)
        case 6:
            performSegue(withIdentifier: "UIAlertControllerViewSegue", sender: nil)
        case 7:
            performSegue(withIdentifier: "TabBarSegue", sender: nil)
        case 8:
            performSegue(withIdentifier: "GestureViewSegue", sender: nil)
        case 9:
            performSegue(withIdentifier: "SafariViewSegue", sender: nil)
        case 10:
            performSegue(withIdentifier: "LocationViewSegue", sender: nil)
        case 11:
            performSegue(withIdentifier: "JsonDecoderSegue", sender: nil)
        case 12:
            performSegue(withIdentifier: "TodoListSegue", sender: nil)
        case 13:
            performSegue(withIdentifier: "UIButtonSegue", sender: nil)
        default:
            return
        }
    }
}

class CellList {
    let cellList: [String] = ["UIView", "UIImageView", "UITextField", "UITextView", "UISlider", "UINavigationController", "UIAlertController", "TabBarController", "GestureViewSegue", "SafariViewController", "Map Kit View", "JSON Decoder", "TableView(Todo List)", "customButton & Activity Indicator"]
    
    var numOfCell: Int {
        return cellList.count
    }
}
