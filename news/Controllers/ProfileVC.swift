//
//  ProfileVC.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit

class ProfileVC: UIViewController {
    
    
    lazy var buttonRegistration:UIButton = {
       var but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.backgroundColor = .black
        but.layer.cornerRadius = 8
        but.setTitle("Регистрация", for: .normal)
        but.setTitleColor(.red, for: .normal)
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
        self.view.backgroundColor = .cyan
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
