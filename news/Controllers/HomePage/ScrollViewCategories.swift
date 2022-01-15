//
//  ScrollView.swift
//  news
//
//  Created by Евгений Маглена on 14.01.2022.
//

import UIKit

class ScrollViewCategories: UIScrollView {

    let namesArray = ["Все" : ".all","Технологии" : ".technology",
                      "Животные" : ".animals",
                      "Бизнес" : ".bisness",
                      "Наука" : ".science"]
    


    
    private func newButton(withName name: String,title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(MyColors.myColor.coldColor, for: .normal)
        return newButton
    }

    func displayed() {
        var buttonArray = [UIButton]()
        for (myKey, myValue) in namesArray {
            buttonArray += [newButton(withName: myValue, title: myKey )]
            let stack = UIStackView(arrangedSubviews: buttonArray)
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.alignment = .fill
            stack.spacing = 8
            stack.translatesAutoresizingMaskIntoConstraints = false
                                      
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)


    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
