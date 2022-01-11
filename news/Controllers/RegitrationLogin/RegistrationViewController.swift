//
//  RegistrationViewController.swift
//  news
//
//  Created by Евгений Маглена on 26.12.2021.
//

import UIKit
import Firebase
import PMSuperButton

class RegistrationViewController: UIViewController {
    
    var data = RegistrationModel()

    lazy var nameTextField:UITextField = {   // поле ввода имени
        var n = UITextField()
        n.translatesAutoresizingMaskIntoConstraints = false
        n.delegate = self
        n.layer.borderColor = UIColor.black.cgColor
        n.attributedPlaceholder = NSAttributedString(string: " Name",
                                                     attributes: [NSAttributedString.Key.foregroundColor : MyColors.myColor.coldColor.withAlphaComponent(0.5)])
        n.backgroundColor = MyColors.myColor.color2leastDark
        n.layer.cornerRadius = 4
        n.keyboardType = .default
       return n
    }()
    
    lazy var surnameTextField: UITextField = { // поле ввода фамилии
       var s = UITextField()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.delegate = self
        s.layer.borderColor = UIColor.black.cgColor
        s.attributedPlaceholder = NSAttributedString(string: " Lastname",
                                                     attributes: [NSAttributedString.Key.foregroundColor : MyColors.myColor.coldColor.withAlphaComponent(0.5)])
        s.backgroundColor = MyColors.myColor.color2leastDark
        s.layer.cornerRadius = 4
        s.keyboardType = .default
        return s
    }()
    
    lazy var birthdayTextField: UITextField = { // поле ввода даты рождения
        var b = UITextField()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.delegate = self
        b.layer.borderColor = UIColor.black.cgColor
        b.attributedPlaceholder = NSAttributedString(string: " Your Birthday date",
                                                     attributes: [NSAttributedString.Key.foregroundColor : MyColors.myColor.coldColor.withAlphaComponent(0.5)])
        b.backgroundColor = MyColors.myColor.color2leastDark
        b.layer.cornerRadius = 4
        b.keyboardType = .default
        return b
    }()
    
    lazy var emailTextField: UITextField = { // поле ввода емаила
       var e = UITextField()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.delegate = self
        e.layer.borderColor = UIColor.black.cgColor
        e.attributedPlaceholder = NSAttributedString(string: " E-mail",
                                                     attributes: [NSAttributedString.Key.foregroundColor : MyColors.myColor.coldColor.withAlphaComponent(0.5)])
        e.backgroundColor = MyColors.myColor.color2leastDark
        e.layer.cornerRadius = 4
        e.keyboardType = .default
        
        return e
    }()
     
    lazy var passwordTextField: UITextField = { // поле ввода пароля
       var p = UITextField()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.delegate = self
        p.isSecureTextEntry = false
        p.layer.borderColor = UIColor.black.cgColor
        p.attributedPlaceholder = NSAttributedString(string: " Password",
                                           attributes: [NSAttributedString.Key.foregroundColor : MyColors.myColor.coldColor.withAlphaComponent(0.5)])
        p.backgroundColor = MyColors.myColor.color2leastDark
        p.layer.cornerRadius = 4
        p.keyboardType = .default
        return p
    }()
    
    lazy var continueButton: PMSuperButton = {
        var button = PMSuperButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        button.setTitle("OK", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = MyColors.myColor.coldColor.withAlphaComponent(0.1).cgColor
        button.setTitleColor(MyColors.myColor.coldColor, for: .normal)
        button.gradientStartColor = MyColors.myColor.color1Dark
        button.gradientEndColor = MyColors.myColor.color2leastDark
        button.gradientEnabled = true
        button.gradientHorizontal = true
        button.backgroundColor = .gray
        button.layer.cornerRadius = 8
        button.rippleColor = MyColors.myColor.color3light
        button.ripple = true
        
        return button
        
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
        addSubviews()
        setConstraints()

    }
    
    private func settings() {
        self.view.backgroundColor = MyColors.myColor.color1Dark
        
    }
    
    func addSubviews() {
        self.view.addSubview(nameTextField)
        self.view.addSubview(surnameTextField)
        self.view.addSubview(birthdayTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(continueButton)

    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([ // имя фамилия ддата
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 102),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextField.widthAnchor.constraint(equalToConstant: 180),
            nameTextField.heightAnchor.constraint(equalToConstant: 34),

            surnameTextField.topAnchor.constraint(equalTo: nameTextField.topAnchor),
            surnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            surnameTextField.widthAnchor.constraint(equalToConstant: 180),
            surnameTextField.heightAnchor.constraint(equalToConstant: 34),
            
            birthdayTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            birthdayTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            birthdayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            birthdayTextField.heightAnchor.constraint(equalToConstant: 34),
        ])
        NSLayoutConstraint.activate([ // емеил пароль
            emailTextField.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: birthdayTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: birthdayTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 34),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34)
            
            
        ])
        NSLayoutConstraint.activate([ // кнопочка регистрации - продолжения
            continueButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            continueButton.centerXAnchor.constraint(equalTo: passwordTextField.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 94),
            continueButton.heightAnchor.constraint(equalToConstant: 44),
        ])

    }
    
    
    @objc func registration() {
        signUpUser()
        

    }
    
    func signUpUser() {
        if !data.name.isEmpty,!data.surname.isEmpty,!data.birthday.isEmpty,
           !data.password.isEmpty,!data.email.isEmpty {
            CustomAI.showAI()
            FirebaseManager.shared.createUserWith(data.data) { error in
                CustomAI.hide()
                if let error = error {
                    self.present(ErrorViewController(message: error.localizedDescription), animated: true, completion: nil)
                } else {
                    self.showSuccess()
                }
            }
        }
    }
    
    func showSuccess() {
        let alert = UIAlertController(title: "Поздравляем", message: "Пользователь зарегистрирован!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func showError(_ error:String) {
        let alert = UIAlertController(title: "Не поздравляем", message: error , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
