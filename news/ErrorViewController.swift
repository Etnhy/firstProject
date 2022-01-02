//
//  ErrorViewController.swift
//  Sonic App
//
//  Created by Serhii Zhuravlov on 27.12.2021.
//

import UIKit

class ErrorViewController: UIViewController {
    let colors = MyColors()
    
    private lazy var conteinerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = colors.color3light
        view.layer.cornerRadius = 8
        view.layer.borderColor = colors.color4easyLight.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22)
        label.textColor = colors.color1Dark
        label.backgroundColor = .clear
        label.text = "Newss"
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = colors.coldColor
        label.backgroundColor = .clear
        label.text = message
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("OK", for: .normal)
        button.setTitleColor(colors.color1Dark, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    private let message: String
    
    init(message: String) {
        self.message = message
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        definesPresentationContext = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        addSubviews()
        activateConstraints()
        addGestures()
    }
        
    private func addSubviews() {
        view.addSubview(conteinerView)
        conteinerView.addSubview(titleLabel)
        conteinerView.addSubview(messageLabel)
        conteinerView.addSubview(button)
    }
    
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            conteinerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            conteinerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            conteinerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            titleLabel.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            messageLabel.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            
            button.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 24),
            button.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -24),
            button.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -24),
        ])
    }
    
    private func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    
    //MARK: - Actions
    @objc private func didTapButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer?) {
            self.dismiss(animated: true, completion: nil)
    }

}

//MARK: - UIGestureRecognizerDelegate
extension ErrorViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
}
