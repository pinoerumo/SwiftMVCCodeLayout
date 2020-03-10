

import UIKit

class SMCLTableViewController: UIViewController {
    private let smclTableView = SMCLTableView()
    private let model = SMCLTableViewModel()
    var closure: ((Device) -> Void)?
    
    
    override func loadView() {
        self.view = smclTableView
        smclTableView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }
    
    func initTableView() {
        smclTableView.tableView.dataSource = model
        smclTableView.tableView.delegate = self
    }
}

extension SMCLTableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.model.dataArray![indexPath.row] as! Device
        closure?(data)
        self.navigationController?.popViewController(animated: true)
    }
}

extension SMCLTableViewController: SMCLTableViewDelegate{
    func smclTableView(_ smclTableView: SMCLTableView, tappedAddButton button: UIButton) {
        model.makeDummyData()
        smclTableView.tableView.reloadData()
    }
}
