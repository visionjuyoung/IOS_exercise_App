import UIKit

class UISliderMenuViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let uisliderViewModel: UisliderMenuModel = UisliderMenuModel()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uisliderViewModel.cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "uisliderMenuCell", for: indexPath)
        cell.textLabel?.text = uisliderViewModel.cell[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "UISliderViewSegue", sender: nil)
        default:
            return
        }
       
    }

    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class UisliderMenuModel {
    let cell: [String] = ["UISlider"]
    
    var cellCount: Int {
        return cell.count
    }
}
