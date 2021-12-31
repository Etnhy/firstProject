//
//  ProfileVC.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit
import PMSuperButton

class ProfileVC: UIViewController {
    let colors = MyColors()
    
    
    lazy var buttonRegistration:UIButton = {
       var but = PMSuperButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.layer.cornerRadius = 8
        but.gradientEnabled = true
        but.ripple = true
        but.gradientStartColor = colors.color1Dark
        but.gradientEndColor = colors.color2leastDark
        but.gradientHorizontal = true
        but.rippleColor = colors.color3light
        but.layer.borderWidth = 1
        but.layer.borderColor = colors.coldColor.withAlphaComponent(0.1).cgColor
        but.setTitle("Регистрация", for: .normal)
        but.setTitleColor(colors.coldColor, for: .normal)
        but.addTarget(self, action: #selector(buttonTarget), for: .touchUpInside)
        
        return but
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        settingsVC()
        addSubviews()
        setConstraints()

        


    }
    private func settingsVC() {
        self.view.backgroundColor = colors.color1Dark
    }
    
    func addSubviews() {
        self.view.addSubview(buttonRegistration)
    }
    func setConstraints() {
        NSLayoutConstraint.activate([
            buttonRegistration.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 50),
            buttonRegistration.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
  @objc  func buttonTarget() {
        let regVC = RegistrationViewController()
      present(regVC, animated: true, completion: nil)
    }

}
