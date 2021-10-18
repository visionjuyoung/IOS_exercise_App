//
//  UITextViewMenuViewController.swift
//  exerciseIos
//
//  Created by 김주영 on 2021/10/18.
//

import UIKit

class UITextViewMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    let textViewModel: TextViewCell = TextViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textViewModel.cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITextViewMenuCell", for: indexPath)
        cell.textLabel?.text = textViewModel.cells[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            performSegue(withIdentifier: "EditTextViewSegue", sender: nil)
        case 1:
            performSegue(withIdentifier: "AutoSizeTextViewSegue", sender: nil)
        default:
            return
        }
    }

}

class TextViewCell {
    var cells: [String] = ["Edit UITextView", "Autosize UITextView"]
    
    var cellCount: Int {
        return cells.count
    }
}
