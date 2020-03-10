

import UIKit

class SMCLLabelViewController: UIViewController {
    private let labelView = SMCLLabelView()
    private let model = SMCLLabelViewModel()
    
    override func loadView() {
        self.view = labelView
        labelView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SMCLLabelViewController :SMCLLabelViewDelegate{
    func smclLabelView(_ smclLabelView: SMCLLabelView, tappedTransitionButton button: UIButton) {
        let nextViewController = SMCLTableViewController()
        
        nextViewController.closure = {(deviceData: Device) -> Void in
            self.labelView.displayLabel.text = deviceData.nameKana
        }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
