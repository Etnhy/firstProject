//
//  BackButtonView.swift
//  news
//
//  Created by Евгений Маглена on 13.01.2022.
//

import UIKit

class BackButtonView: UIButton {

    var imageNamed: String? {
        didSet {
            guard let imageNamed = imageNamed else {return}
            
            setImage(UIImage(named: imageNamed)?.withTintColor(.brown), for: .normal)
            setImage(UIImage(named: imageNamed)?.withTintColor(UIColor.brown.withAlphaComponent(0.5)), for: .highlighted)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * self.frame.size.height
    }
    
    private func setupView() {
        contentVerticalAlignment = .center
        contentHorizontalAlignment = .center
        backgroundColor = .clear
    }
    
}


