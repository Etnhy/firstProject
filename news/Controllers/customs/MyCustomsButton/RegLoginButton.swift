//
//  RegLoginButton.swift
//  news
//
//  Created by Евгений Маглена on 14.01.2022.
//

import UIKit
import PMSuperButton

class RegLoginButton: PMSuperButton {


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentVerticalAlignment = .center
        contentHorizontalAlignment = .center
        backgroundColor = .clear

    }
    
}
