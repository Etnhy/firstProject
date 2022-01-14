//
//  ScrollView.swift
//  news
//
//  Created by Евгений Маглена on 14.01.2022.
//

import UIKit

class ScrollViewCategories: UIScrollView {
    

    lazy var stackButtonsCategories: UIStackView = {
     var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 16
        stack.addArrangedSubview(techButton)
        return stack
    }()
    
    lazy var techButton: UIButton = {
       var tech = UIButton()
        tech.setTitle("tech", for: .normal)
        tech.backgroundColor = .black
        return tech
    }()
    lazy var bissnButton: UIButton = {
       var tech = UIButton()
        tech.setTitle("tech", for: .normal)

        return tech
    }()
    lazy var animalButton: UIButton = {
       var tech = UIButton()
        tech.setTitle("tech", for: .normal)

        return tech
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addStack()
        settingsScrollView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSub() {
        
    }
    
    

    
    func settingsScrollView (){
        stackButtonsCategories.addSubview(techButton)
        stackButtonsCategories.addSubview(bissnButton)
        stackButtonsCategories.addArrangedSubview(animalButton)
        
    }
    
    func addStack() {
        stackButtonsCategories.addArrangedSubview(techButton)
        stackButtonsCategories.addArrangedSubview(bissnButton)
        stackButtonsCategories.addArrangedSubview(animalButton)
    }
    

}
