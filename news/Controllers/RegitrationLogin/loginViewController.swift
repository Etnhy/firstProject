//
//  loginViewController.swift
//  news
//
//  Created by Евгений Маглена on 13.01.2022.
//

import UIKit

class loginViewController: MainViewController {
    
    lazy var button: UIButton = {
            let view = UIButton()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.setTitle("Next VC", for: .normal)
            view.setAttributedTitle(NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor : UIColor.brown, .font : UIFont.systemFont(ofSize: 16)]), for: .normal)
            view.setAttributedTitle(NSAttributedString(string: "LOGIN", attributes: [NSAttributedString.Key.foregroundColor : UIColor.brown.withAlphaComponent(0.5), .font : UIFont.systemFont(ofSize: 16)]), for: .highlighted)
            view.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
            return view
        }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        configure()
        view.addSubview(button)
        
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        

    }
    private func configure() {
            headerView.backButton.isHidden = true
            headerView.titleLabel.text = "SW"
        }
    private func addButton() {
            view.addSubview(button)
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        }
        
        //MARK: - Actions
        @objc func didTapActionButton() {
//            let nextVC = MainTabBarController()
//            self.navigationController?.pushViewController(nextVC, animated: true)
            UserDefaults.standard.setValue("user", forKey: "currentUser")
            NotificationCenter.default.post(name: .CurrentDidChange, object: nil)
        }
}
