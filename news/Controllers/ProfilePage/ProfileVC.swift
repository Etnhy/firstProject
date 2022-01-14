//
//  ProfileVC.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit
import PMSuperButton

class ProfileVC: MainViewController {
    
    lazy var buttonRegistration:UIButton = {
        var but = PMSuperButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.layer.cornerRadius = 8
        but.gradientEnabled = true
        but.ripple = true
        but.gradientStartColor = MyColors.myColor.color1Dark
        but.gradientEndColor = MyColors.myColor.color1Dark.withAlphaComponent(0.75)
        but.gradientHorizontal = true
        but.rippleColor = MyColors.myColor.color3light
        but.layer.borderWidth = 1
        but.layer.borderColor = MyColors.myColor.coldColor.withAlphaComponent(0.1).cgColor
        but.setTitle("Регистрация", for: .normal)
        but.setTitleColor(MyColors.myColor.coldColor, for: .normal)
        but.addTarget(self, action: #selector(buttonTarget), for: .touchUpInside)
        
        return but
    }()
    
    lazy var exitButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Next VC", for: .normal)
        view.setAttributedTitle(NSAttributedString(string: "exit", attributes: [NSAttributedString.Key.foregroundColor : UIColor.brown, .font : UIFont.systemFont(ofSize: 16)]), for: .normal)
        view.setAttributedTitle(NSAttributedString(string: "EXIT", attributes: [NSAttributedString.Key.foregroundColor : UIColor.brown.withAlphaComponent(0.5), .font : UIFont.systemFont(ofSize: 16)]), for: .highlighted)
        view.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        settingsVC()
        addSubviews()
        setConstraints()

    }
    private func settingsVC() {
        self.view.backgroundColor = MyColors.myColor.color2leastDark
    }
    
    func addSubviews() {
        self.view.addSubview(buttonRegistration)
        self.view.addSubview(exitButton)
    }
    func setConstraints() {
        NSLayoutConstraint.activate([
            buttonRegistration.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 50),
            buttonRegistration.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16)
        ])
        NSLayoutConstraint.activate([
            exitButton.leadingAnchor.constraint(equalTo: buttonRegistration.trailingAnchor,constant: 20),
            exitButton.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 50)
        ])
        
    }
    
    //MARK: - Actions
    @objc  func buttonTarget() {
        let regVC = RegistrationViewController()
        present(regVC, animated: true, completion: nil)
    }
    
    @objc func didTapActionButton() {
        //            let nextVC = MainTabBarController()
        //            self.navigationController?.pushViewController(nextVC, animated: true)
        UserDefaults.standard.setValue(nil, forKey: "currentUser")
        NotificationCenter.default.post(name: .CurrentDidChange, object: nil)
    }
}



