//
//  customStackButton.swift
//  news
//
//  Created by Евгений Маглена on 15.01.2022.
//

import UIKit

class customStackButton: UIButton {
    
    let nameButtons = ["Animal":"Животные", "Business":"Бизнес",
                       "Technology":"Технологии","Music":"Музыка"]
    
    
    lazy var stackBut: UIStackView = {
     var stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.layer.borderWidth = 0.3
        stack.layer.borderColor = MyColors.myColor.color4easyLight.cgColor
        stack.addArrangedSubview(createButtonsCategories(with: "Все"))
        stack.addArrangedSubview(createButtonsCategories(with: "Животные"))
        stack.addArrangedSubview(createButtonsCategories(with: "Музыка"))
        stack.addArrangedSubview(createButtonsCategories(with: "Технологии"))
        stack.addArrangedSubview(createButtonsCategories(with: "Политика"))
        stack.addArrangedSubview(createButtonsCategories(with: "чот еще"))
        stack.addArrangedSubview(createButtonsCategories(with: "чот еще"))

        stack.translatesAutoresizingMaskIntoConstraints = false

        return stack
    }()
    
    lazy var button1: UIButton = {
       var but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.setTitle("first", for: .normal)
        but.setTitleColor(.yellow, for: .normal)
        but.backgroundColor = .clear
        
        return but
    }()
    lazy var button2: UIButton = {
       var but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.setTitle("Second", for: .normal)
        but.setTitleColor(.yellow, for: .normal)
        but.backgroundColor = .clear
        
        return but
    }()
    lazy var button3: UIButton = {
       var but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.setTitle("Third", for: .normal)
        but.setTitleColor(.yellow, for: .normal)
        but.backgroundColor = .clear
        
        return but
    }()


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        created()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        created()
    }
    
    private func setupView() {
        addSubview(stackBut)
//        addSubview(button1)
//        addSubview(button2)
//        addSubview(button3)

    }
    
    func createButtonsCategories(with title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.backgroundColor = .clear
        newButton.setTitle(title, for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.setTitleColor(.yellow, for: .normal)
        return newButton
    }
    func created() {
        var buttonArray = [UIButton]()
        for (_, myValue) in nameButtons {
            buttonArray += [createButtonsCategories(with: myValue)]
        }
    }
    
}
