//
//  FvoritesVC.swift
//  news
//
//  Created by Евгений Маглена on 27.12.2021.
//

import UIKit

class FavoritesVC: FavoritesMain {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        settingsVC()
        
    }
    
    
    private func settingsVC() {
        
        self.view.backgroundColor = MyColors.myColor.color1Dark
    }


}
