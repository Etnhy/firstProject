//
//  ProfileMainViewController.swift
//  news
//
//  Created by Евгений Маглена on 12.01.2022.
//

import UIKit
import PMSuperButton
class ProfileMainViewController: UIViewController {
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
        self.view.backgroundColor = colors.color1Dark
    }
    
    func addSubviews() {
        self.view.addSubview(buttonRegistration)
        self.view.addSubview(exitButton)
    }
    func setConstraints() {
        NSLayoutConstraint.activate([
            buttonRegistration.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 50),
            buttonRegistration.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 16)
        ])
        NSLayoutConstraint.activate([
            exitButton.leadingAnchor.constraint(equalTo: buttonRegistration.trailingAnchor,constant: 20),
            exitButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50)
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

