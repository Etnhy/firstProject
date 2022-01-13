//
//  MainHeaderView.swift
//  news
//
//  Created by Евгений Маглена on 13.01.2022.
//

import UIKit

class MainHeaderView: UIView {
    
    lazy var backButton: BackButtonView = {
        let button = BackButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageNamed = "back"
        return button
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18)
        label.textColor = .brown
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addSubViews()
        activateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - setup view
    private func setupView() {
        backgroundColor = .white
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 1.0
    }
    
    private func addSubViews() {
        addSubview(backButton)
        addSubview(separatorView)
        addSubview(titleLabel)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            backButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            separatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
