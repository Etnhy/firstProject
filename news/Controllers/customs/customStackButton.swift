//
//  customStackButton.swift
//  news
//
//  Created by Евгений Маглена on 15.01.2022.
//

import UIKit



class customStackButton: UIView {
    weak var delegate: CategoriesButtonDelegate?


    
    let namesButtons = ["Все","Животные","Технологии","Бизнес","Музыка"]
    let tagsNames = ["all": "Все" ,"animals": "Животные" ,
                     "tech": "Технологии" ,"biss": "Бизнес" ,"music": "Музыка" ]

    
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
     var stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var buttons: [UIButton] = {
        var views = [UIButton]()
        for (tag,myTitile) in namesButtons.enumerated() {
            let view = UIButton()
            view.tag = tag
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.yellow.cgColor
            view.setAttributedTitle(NSAttributedString(string: myTitile,attributes: [NSAttributedString.Key.font : UIFont.GTWalsheimProBold(ofSize: 14),
                                                                                     NSAttributedString.Key.foregroundColor : MyColors.myColor.color4easyLight]), for: .normal)
//                        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapAction(_:))))
            view.addTarget(nil, action: #selector(didTapAction), for: .touchUpInside)
            views.append(view)
            //            views.sorted(by: { $0.tag < $1.tag })
        }
        return views
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
    //MARK: -  actions
    @objc func didTapAction() {
        
    
    }
        

    
    
    private func setupView() {
        addSubview(scroller)
//        addSubview(stackBut)
        
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




