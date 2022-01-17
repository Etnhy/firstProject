//
//  customStackButton.swift
//  news
//
//  Created by Евгений Маглена on 15.01.2022.
//

import UIKit

class customStackButton: UIButton {
    
    let nameButtons = ["Животные": "Животные", "Бизнес": "Бизнес",
                       "Технологии": "Технологии", "Музыка": "Музыка"]
    

    
    
    lazy var scroller: UIScrollView = {
       var scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        scroll.isDirectionalLockEnabled = true
        scroll.contentSize = CGSize(width: 670, height: 0)
        scroll.backgroundColor = MyColors.myColor.color2leastDark
        scroll.addSubview(stackBut)
        
        return scroll
    }()
    
    
    lazy var stackBut: UIStackView = {
     var stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
    }
    
    private func setupView() {
        addSubview(scroller)
        addSubview(stackBut)
    }
    
    func createButtonsCategories(with title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = .clear
        newButton.setAttributedTitle(NSAttributedString(string: title,attributes: [NSAttributedString.Key.font : UIFont.GTWalsheimProBold(ofSize: 16)]), for: .normal)
        newButton.setTitleColor(MyColors.myColor.color4easyLight, for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        return newButton
    }
}
