//
//  CustomTabBarViewController.swift
//  news
//
//  Created by Евгений Маглена on 28.12.2021.
//

import UIKit

class CustomTabBarViewController: UIViewController {
    let colors = MyColors()
    
    lazy var backView:UIView = {
       var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 8
        view.backgroundColor = .red
        view.contentMode = .scaleToFill
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 15

        return view
    }()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        addSubviews()
        setContraints()

    }
    
    func addSubviews() {
        self.view.addSubview(backView)
        
    }
    

    
    func setContraints() {
        NSLayoutConstraint.activate([
        backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
        backView.heightAnchor.constraint(equalToConstant: 70),
        backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        backView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10)
        
        ])
    }
    
    @objc func homeItemSelector() {
        print("tapped")
    }
    
    
    
    
    func createBarButtonItem(title: String, image: String, selector: Selector, reverse: Bool) -> UIBarButtonItem {
        let button = UIButton(type: .system)
           button.setImage(UIImage(named: image), for: .normal)
           let titleString = reverse ?  title + " " : " " + title
           button.setTitle(titleString, for: .normal)
           button.addTarget(self, action: selector, for: .touchUpInside)
           if reverse {
               button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
               button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
               button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
           }
           button.sizeToFit()
           let barItem = UIBarButtonItem(customView: button)
           
           return barItem
        
        
       }
        
        
    }


