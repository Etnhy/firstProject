//
//  RegistrationViewController.swift
//  news
//
//  Created by Евгений Маглена on 26.12.2021.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController { // поле ввода имени
    
    var data = RegistrationModel()
    
    
    lazy var nameTextField:UITextField = {
        var n = UITextField()
        n.translatesAutoresizingMaskIntoConstraints = false
        n.delegate = self
        n.layer.borderColor = UIColor.black.cgColor
        n.placeholder = "Имя"
        n.layer.cornerRadius = 1
        n.layer.borderWidth = 1
        n.keyboardType = .default
       return n
    }()
    
    lazy var surnameTextField: UITextField = { // поле ввода фамилии
       var s = UITextField()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.delegate = self
        s.layer.borderColor = UIColor.black.cgColor
        s.placeholder = "Фамилия"
        s.layer.borderWidth = 1
        s.layer.cornerRadius = 1
        s.keyboardType = .default
        return s
    }()
    
    lazy var birthdayTextField: UITextField = { // поле ввода даты рождения
        var b = UITextField()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.delegate = self
        b.layer.borderColor = UIColor.black.cgColor
        b.placeholder = "Дата рождения"
        b.layer.cornerRadius = 1
        b.layer.borderWidth = 1
        b.keyboardType = .default
        return b
    }()
    
    lazy var emailTextField: UITextField = { // поле ввода емаила
       var e = UITextField()
        e.translatesAutoresizingMaskIntoConstraints = false
        e.delegate = self
        e.layer.borderColor = UIColor.black.cgColor
        e.placeholder = "e-mail"
        e.layer.borderWidth = 1
        e.layer.cornerRadius = 1
        e.keyboardType = .default
        
        return e
    }()
     
    lazy var passwordTextField: UITextField = { // поле ввода пароля
       var p = UITextField()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.delegate = self
        p.isSecureTextEntry = false
        p.layer.borderColor = UIColor.black.cgColor
        p.placeholder = "password"
        p.layer.borderWidth = 1
        p.layer.cornerRadius = 1
        p.keyboardType = .default
        return p
    }()
    
    lazy var continueButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 3
        button.backgroundColor = .white
        button.setTitle("Reg", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(registration), for: .touchUpInside)
        return button
        
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
        addSubviews()
        setConstraints()

    }
    
    private func settings() {
        self.view.backgroundColor = .white
        
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
            continueButton.widthAnchor.constraint(equalToConstant: 64),
            continueButton.heightAnchor.constraint(equalToConstant: 34),
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
                    //self.showError("ERROR")
                    self.present(ErrorViewController(message: error.localizedDescription), animated: true, completion: nil)
                } else {
                    self.showSuccess()
                }
            }
        }
    }
    
    func showSuccess() {
        let alert = UIAlertController(title: "Поздравляем", message: "пользователь зарегистрирован!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func showError(_ error:String) {
        let alert = UIAlertController(title: "Не поздравляем", message: error , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
