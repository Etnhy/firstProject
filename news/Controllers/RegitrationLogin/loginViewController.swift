//
//  loginViewController.swift
//  news
//
//  Created by Евгений Маглена on 13.01.2022.
//

import UIKit
import PMSuperButton
import Firebase

class loginViewController: MainViewController {
    
    lazy var emailField: UITextField = {
       var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.layer.borderColor = UIColor.black.cgColor
        view.attributedPlaceholder = NSAttributedString(string: " E-mail",
                                                     attributes: [NSAttributedString.Key.foregroundColor : MyColors.myColor.coldColor.withAlphaComponent(0.5)])
        view.backgroundColor = MyColors.myColor.color1Dark
        view.layer.cornerRadius = 4
        view.keyboardType = .default
        
        
        return view
    }()
    lazy var passwordField: UITextField = {
       var view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.layer.borderColor = UIColor.black.cgColor
        view.attributedPlaceholder = NSAttributedString(string: " Password",
                                                     attributes: [NSAttributedString.Key.foregroundColor : MyColors.myColor.coldColor.withAlphaComponent(0.5)])
        view.backgroundColor = MyColors.myColor.color1Dark
        view.layer.cornerRadius = 4
        view.keyboardType = .default
        
        
        return view
    }()
    
    lazy var button: PMSuperButton = {
        let view = PMSuperButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setAttributedTitle(NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor : UIColor.brown, .font : UIFont.systemFont(ofSize: 16)]), for: .normal)
        view.setAttributedTitle(NSAttributedString(string: "LOGIN", attributes: [NSAttributedString.Key.foregroundColor : UIColor.brown.withAlphaComponent(0.5), .font : UIFont.systemFont(ofSize: 16)]), for: .highlighted)
        view.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        view.gradientStartColor = MyColors.myColor.color1Dark
        view.gradientEndColor = MyColors.myColor.color2leastDark
        view.gradientEnabled = true
        view.gradientHorizontal = true
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.ripple = true
        view.rippleColor = MyColors.myColor.color3light

        
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        configure()
        self.view.backgroundColor = MyColors.myColor.color2leastDark
        view.addSubview(button)
        addButton()
        


    }
    private func configure() {
            headerView.backButton.isHidden = true
            headerView.titleLabel.text = "SW"
        }
    private func addButton() {
        view.addSubview(emailField)
        NSLayoutConstraint.activate([ // e mail
            emailField.topAnchor.constraint(equalTo: view.topAnchor,constant: 200),
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            emailField.heightAnchor.constraint(equalToConstant: 34)

        ])
        view.addSubview(passwordField)
        NSLayoutConstraint.activate([ // password
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 24),
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 34)

            
        ])
        view.addSubview(button)
        NSLayoutConstraint.activate([ // button
            button.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 24),
            button.widthAnchor.constraint(equalToConstant: 94),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        }
        
        //MARK: - Actions
        @objc func didTapActionButton() {
            UserDefaults.standard.setValue("user", forKey: "currentUser")
            NotificationCenter.default.post(name: .CurrentDidChange, object: nil)
        }
}


extension loginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
