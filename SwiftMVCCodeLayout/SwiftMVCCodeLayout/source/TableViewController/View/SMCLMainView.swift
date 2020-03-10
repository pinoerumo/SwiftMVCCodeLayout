

import UIKit

protocol SMCLTableViewDelegate: AnyObject {
    func smclTableView(_ smclTableView: SMCLTableView,
                            tappedAddButton button: UIButton)
}

class SMCLTableView: UIView {
    weak var delegate: SMCLTableViewDelegate?
    /**データ表示テーブルビュー*/
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setLayout()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    func setLayout(){
        setBackView()
        setTableView()
        setSendButton()
    }
    
    func setBackView(){
        let backView: UIView = {
            let backView = UIView()
            backView.translatesAutoresizingMaskIntoConstraints = false
            backView.backgroundColor = .white
            return backView
        }()
        self.addSubview(backView)
        backView.topAnchor.constraint(equalTo: self.topAnchor, constant:0).isActive = true
        backView.leftAnchor.constraint(equalTo: self.leftAnchor, constant:0).isActive = true
        backView.rightAnchor.constraint(equalTo: self.rightAnchor, constant:0).isActive = true
        backView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:0).isActive = true
    }
    
    func setTableView(){
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant:0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant:0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant:0).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
    }
    
    func setSendButton(){
        //内包するビューを作成
        let buttonView: UIView = {
            let buttonView = UIView()
            buttonView.translatesAutoresizingMaskIntoConstraints = false
            buttonView.backgroundColor = .white
            return buttonView
        }()
        self.addSubview(buttonView)
        buttonView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant:0).isActive = true
        buttonView.leftAnchor.constraint(equalTo: self.leftAnchor, constant:0).isActive = true
        buttonView.rightAnchor.constraint(equalTo: self.rightAnchor, constant:0).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:0).isActive = true
        
        
        let button: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("追加", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.backgroundColor = .white
            button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
            return button
        }()
        buttonView.addSubview(button)
        button.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: buttonView.heightAnchor, multiplier: 0.8).isActive = true
        button.widthAnchor.constraint(equalTo: buttonView.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    
    
    /// 追加ボタン押下時のメソッド
    /// - Parameter button: 追加ボタン
    @objc func tappedAddButton(_ button: UIButton) {
        delegate?.smclTableView(self, tappedAddButton: button)
    }


}
