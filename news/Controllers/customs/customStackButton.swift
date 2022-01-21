//
//  customStackButton.swift
//  news
//
//  Created by Евгений Маглена on 15.01.2022.
//

import UIKit
protocol CustomStackButtonDelegate: AnyObject {
    func customStackButtonDelegate(_ selectedIndex: Int )
}
class customStackButton: UIScrollView {
    
    weak var myDelegate: CustomStackButtonDelegate?

    let namesButtons = ["Все","Животные","Технологии","Бизнес","Музыка", "что то"]
    
    

    lazy var stackBut: UIStackView = {
        var stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
//    private lazy var items: [UIButton] = {
//        var views: [UIButton] = []
//        for itemTitle in itemTitles {
//            let button = UIButton()

    lazy var buttons: [UIButton] = {
        var buttons:[UIButton] = []
        for buttonTitle in namesButtons {
            let view = MainButtonCat()
            view.setAttributedTitle(NSAttributedString(string: buttonTitle,attributes: [NSAttributedString.Key.font : UIFont.GTWalsheimProBold(ofSize: 14),                                                                    NSAttributedString.Key.foregroundColor : MyColors.myColor.color4easyLight.withAlphaComponent(0.85)]), for: .normal)
            view.addTarget(self, action: #selector(didTapAction(_:)), for: .touchUpInside)
            buttons.append(view)
            print(index)
        }
        buttons[0].isSelected = true
        return buttons
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activateConstraints()
    }
    
    
    private func setupView() {
        self.isScrollEnabled = true
        self.isDirectionalLockEnabled = true
        self.contentSize = CGSize(width: 670, height: 40)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackBut)
        
        
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackBut.topAnchor.constraint(equalTo: self.topAnchor),
            stackBut.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackBut.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBut.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        ])
    }
    //MARK: -  actions
    @objc func didTapAction(_ sender: UIButton) {
        for (index,button) in self.buttons.enumerated() {
            if button == sender {
                button.isSelected = true
                myDelegate?.customStackButtonDelegate(index)
                button.setAttributedTitle(NSAttributedString(string: namesButtons[index],attributes: [NSAttributedString.Key.font : UIFont.GTWalsheimProBold(ofSize: 14),NSAttributedString.Key.foregroundColor : MyColors.myColor.color4easyLight]), for: .normal)
            } else  {
                button.setAttributedTitle(NSAttributedString(string: namesButtons[index],attributes: [NSAttributedString.Key.font : UIFont.GTWalsheimProBold(ofSize: 14),NSAttributedString.Key.foregroundColor : MyColors.myColor.color4easyLight.withAlphaComponent(0.85)]), for: .normal)
                
            }
        }
    }

    
    
    class MainButtonCat: UIButton {
        var index: Int?
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    }
}
extension MainTabBarController: CustomStackButtonDelegate {
    func customStackButtonDelegate(_ selectedIndex: Int) {
        print("selected \(selectedIndex)")
    }
}




