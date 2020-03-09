

import UIKit

protocol SMCLLabelViewDelegate: AnyObject {
    func smclLabelView(_ smclLabelView: SMCLLabelView,
                            tappedTransitionButton button: UIButton)
}

class SMCLLabelView: UIView {
    weak var delegate: SMCLLabelViewDelegate?
    /**デバイスのかな情報を表示するラベル*/
    var displayLabel = UILabel()
    
    /// レイアウトを設定します
    func setLayout() {
        setBackView()
        setTransitionButton()
    }
    
    
    /// 背景ビューを生成します
    func setBackView() {
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
    
    
    /// 次の画面へ遷移するボタンを生成します
    func setTransitionButton() {
        let transitionButton: UIButton = {
            let transitionButton = UIButton()
            transitionButton.translatesAutoresizingMaskIntoConstraints = false
            transitionButton.setTitle("次の画面へ遷移", for: .normal)
            transitionButton.setTitleColor(.blue, for: .normal)
            transitionButton.addTarget(self, action: #selector(tappedTransitionButton), for: .touchUpInside)
            return transitionButton
        }()
        self.addSubview(transitionButton)
        transitionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        transitionButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        transitionButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        transitionButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        displayLabel = UILabel()
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        displayLabel.text = "Labelです"
        self.addSubview(displayLabel)
        displayLabel.topAnchor.constraint(equalTo:transitionButton.bottomAnchor, constant:10.0).isActive = true
        displayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    
    /// 次の画面へ遷移します
    /// - Parameter button: transitionButton
    @objc func tappedTransitionButton(_ button: UIButton) {
        delegate?.smclLabelView(self, tappedTransitionButton: button)
    }

}
